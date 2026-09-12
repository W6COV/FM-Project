/* -*- c++ -*- */
/*
 * Copyright 2026 Christopher Hansen.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef INCLUDED_NEWFM_PAPGERCH_H
#define INCLUDED_NEWFM_PAPGERCH_H

#include <gnuradio/newFM/api.h>
#include <gnuradio/sync_block.h>

namespace gr {
namespace newFM {

/*!
 * \brief <+description of block+>
 * \ingroup newFM
 *
 */
class NEWFM_API papGerch : virtual public gr::sync_block
{
public:
    typedef std::shared_ptr<papGerch> sptr;

    /*!
     * \brief Return a shared_ptr to a new instance of newFM::papGerch.
     *
     * To avoid accidental use of raw pointers, newFM::papGerch's
     * constructor is in a private implementation
     * class. newFM::papGerch::make is the public interface for
     * creating new instances.
     */
    static sptr make(int blockSize = 256, float thresh = 0.25);
};

} // namespace newFM
} // namespace gr

#endif /* INCLUDED_NEWFM_PAPGERCH_H */
