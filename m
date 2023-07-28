Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A63AD5C
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 06:58:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-407ff54164dso1642641cf.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 23:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690527487; x=1691132287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJWRF/nguMqHhP6pCj/oy6RKbdRAQZsjUlzFM95hJj4=;
        b=Pt69UbpGJP3CFI74TCBFPcNw7IuZ2cEAKMjEldJq8+S5t1aY9tqMQA5F5LCo2HVTbS
         4aneSuoMJPPsrDEgAo+vuOSDaZ2lgHqhOqYiZNdwJAg8P6UM0w6wCYgvaYJJXKd05rr9
         xqYeheb7IntVEAXL7DdKPoDYhUFW6aJ90PGWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527487; x=1691132287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJWRF/nguMqHhP6pCj/oy6RKbdRAQZsjUlzFM95hJj4=;
        b=RK5qQduiWozT6IdbjuArzmuRgj48wCudTQsDBthMINKudDGI8fla2IkpYn3VTHHdCD
         Vez4y+5A8VYy3mSQ1o/qPRPkYvHku2yqUJl65qzENnEWtbshr0lMPRbbsdo3kolIC2Ju
         c9xavD0pAvT2GH1Itehnf4ttF9a1qfS90UqhHU3oOEo9zY1Szlo+AafKbV0XS5tj+wus
         TtdAYlcc9fbQkeLCOwrHznivImgt+LTKr2FCDTt6dN786RE5pn32u9wRoA0ZKXMjMv1s
         iQZnomzNJOHOAJrj8ZMzHsZbzv4nfHHVpraC5Y2CZ2A711K4RCqtpWZ6yRqJng5mTXK2
         PkCA==
X-Gm-Message-State: ABy/qLZbQzd9th4Ho1Una9s3CELZCxAMiP/Ec7qHPnVF2cHNE/ucGi5f
	Dpi3Z5wOZZ2nldbiTrz+GuLsOCAGO1sEfnEyMaGd7i/W
X-Google-Smtp-Source: APBJJlHhMaicGHmdp9WvP9lw5916YxKfbygQk6cmBuc4n0XBvCEjCNThElNo2Pq/piS9hdjwUI4o7w==
X-Received: by 2002:a05:620a:661:b0:767:21b7:86e7 with SMTP id a1-20020a05620a066100b0076721b786e7mr1328411qkh.73.1690527486811;
        Thu, 27 Jul 2023 23:58:06 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id pi37-20020a05620a37a500b00767d00d10e9sm924620qkn.58.2023.07.27.23.58.06
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 23:58:06 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63d0228d32bso11298146d6.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 23:58:06 -0700 (PDT)
X-Received: by 2002:ad4:410a:0:b0:637:2235:4a29 with SMTP id
 i10-20020ad4410a000000b0063722354a29mr1482697qvp.30.1690527485500; Thu, 27
 Jul 2023 23:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-11-benjamin.gaignard@collabora.com>
 <80a03c29-6f3d-43f1-755c-10f3ae2c2756@synaptics.com> <42a45bad-09c7-ffb6-49cb-29ec0826599d@collabora.com>
 <3b22fda9-4a0e-2c03-2f12-19e5e3239235@synaptics.com> <54833256-7d88-9316-4f0f-b8c57552cd7b@synaptics.com>
 <20230713090944.3gxrxt7lqnozhu7r@chromium.org> <e4bb9520-489f-2bb3-4a17-668c3f448668@synaptics.com>
In-Reply-To: <e4bb9520-489f-2bb3-4a17-668c3f448668@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Jul 2023 15:57:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D8bTdqT4tS5R4P60+T+qLcqQ-JMeA3vSN6TRLQXCazWw@mail.gmail.com>
Message-ID: <CAAFQd5D8bTdqT4tS5R4P60+T+qLcqQ-JMeA3vSN6TRLQXCazWw@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, ming.qian@nxp.com, 
	hverkuil-cisco@xs4all.nl, gregkh@linuxfoundation.org, 
	ezequiel@vanguardiasur.com.ar, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, nicolas.dufresne@collabora.com, 
	linux-staging@lists.linux.dev, kernel@collabora.com, mchehab@kernel.org, 
	m.szyprowski@samsung.com, ayaka <ayaka@soulik.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 11:17=E2=80=AFAM Hsia-Jun Li <Randy.Li@synaptics.co=
m> wrote:
>
>
> On 7/13/23 17:09, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > On Fri, Jun 30, 2023 at 05:43:51PM +0800, Hsia-Jun Li wrote:
> >> On 6/27/23 16:47, Hsia-Jun Li wrote:
> >>> CAUTION: Email originated externally, do not click links or open
> >>> attachments unless you recognize the sender and know the content is
> >>> safe.
> >>>
> >>>
> >>> On 6/27/23 16:43, Benjamin Gaignard wrote:
> >>>> CAUTION: Email originated externally, do not click links or open
> >>>> attachments unless you recognize the sender and know the content is
> >>>> safe.
> >>>>
> >>>>
> >>>> Le 27/06/2023 =C3=A0 09:30, Hsia-Jun Li a =C3=A9crit :
> >>>>> On 6/22/23 21:13, Benjamin Gaignard wrote:
> >>>>>> CAUTION: Email originated externally, do not click links or open
> >>>>>> attachments unless you recognize the sender and know the content i=
s
> >>>>>> safe.
> >>>>>>
> >>>>>>
> >>>>>> VIDIOC_DELETE_BUF ioctl allows to delete a buffer from a queue.
> >>>>>>
> >>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >>>>>> ---
> >>>>>>    .../userspace-api/media/v4l/user-func.rst     |  1 +
> >>>>>>    .../media/v4l/vidioc-delete-buf.rst           | 51
> >>>>>> +++++++++++++++++++
> >>>>>>    .../media/common/videobuf2/videobuf2-core.c   | 33 ++++++++++++
> >>>>>>    .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +++
> >>>>>>    drivers/media/v4l2-core/v4l2-dev.c            |  1 +
> >>>>>>    drivers/media/v4l2-core/v4l2-ioctl.c          | 10 ++++
> >>>>>>    include/media/v4l2-ioctl.h                    |  4 ++
> >>>>>>    include/media/videobuf2-core.h                |  9 ++++
> >>>>>>    include/media/videobuf2-v4l2.h                | 11 ++++
> >>>>>>    include/uapi/linux/videodev2.h                |  2 +
> >>>>>>    10 files changed, 128 insertions(+)
> >>>>>>    create mode 100644
> >>>>>> Documentation/userspace-api/media/v4l/vidioc-delete-buf.rst
> >>>>>>
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst
> >>>>>> b/Documentation/userspace-api/media/v4l/user-func.rst
> >>>>>> index 15ff0bf7bbe6..8c74016e12fd 100644
> >>>>>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> >>>>>> @@ -17,6 +17,7 @@ Function Reference
> >>>>>>        vidioc-dbg-g-chip-info
> >>>>>>        vidioc-dbg-g-register
> >>>>>>        vidioc-decoder-cmd
> >>>>>> +    vidioc-delete-buf
> >>>>>>        vidioc-dqevent
> >>>>>>        vidioc-dv-timings-cap
> >>>>>>        vidioc-encoder-cmd
> >>>>>> diff --git
> >>>>>> a/Documentation/userspace-api/media/v4l/vidioc-delete-buf.rst
> >>>>>> b/Documentation/userspace-api/media/v4l/vidioc-delete-buf.rst
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..0e7ce58f91bc
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-delete-buf.rst
> >>>>>> @@ -0,0 +1,51 @@
> >>>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>>> +.. c:namespace:: V4L
> >>>>>> +
> >>>>>> +.. _VIDIOC_DELETE_BUF:
> >>>>>> +
> >>>>>> +************************
> >>>>>> +ioctl VIDIOC_DELETE_BUF
> >>>>>> +************************
> >>>>>> +
> >>>>>> +Name
> >>>>>> +=3D=3D=3D=3D
> >>>>>> +
> >>>>>> +VIDIOC_DELETE_BUF - Delete a buffer from a queue
> >>>>>> +
> >>>>>> +Synopsis
> >>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>> +
> >>>>>> +.. c:macro:: VIDIOC_DELETE_BUF
> >>>>>> +
> >>>>>> +``int ioctl(int fd, VIDIOC_DELETE_BUF, struct v4l2_buffer *argp)`=
`
> >>>>>> +
> >>>>>> +Arguments
> >>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>> +
> >>>>>> +``fd``
> >>>>>> +    File descriptor returned by :c:func:`open()`.
> >>>>>> +
> >>>>>> +``argp``
> >>>>>> +    Pointer to struct :c:type:`v4l2_buffer`.
> >>>>>> +
> >>>>>> +Description
> >>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>> +
> >>>>>> +Applications can optionally call the
> >>>>>> :ref:`VIDIOC_DELETE_BUF` ioctl to
> >>>>>> +delete a buffer from a queue.
> >>>>>> +
> >>>>>> +The struct :c:type:`v4l2_buffer` structure is specified in
> >>>>>> +:ref:`buffer`.
> >>>>>> +
> >>>>>> +Return Value
> >>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>> +
> >>>>>> +On success 0 is returned, on error -1 and the ``errno`` variable =
is
> >>>>>> set
> >>>>>> +appropriately. The generic error codes are described at the
> >>>>>> +:ref:`Generic Error Codes <gen-errors>` chapter.
> >>>>>> +
> >>>>>> +EBUSY
> >>>>>> +    File I/O is in progress.
> >>>>>> +
> >>>>>> +EINVAL
> >>>>>> +    The buffer ``index`` doesn't exist in the queue.
> >>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>>> b/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>>> index 899783f67580..aa546c972c3d 100644
> >>>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >>>>>> @@ -1637,6 +1637,39 @@ int vb2_core_prepare_buf(struct vb2_queue *=
q,
> >>>>>> unsigned int index, void *pb)
> >>>>>>    }
> >>>>>>    EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
> >>>>>>
> >>>>>> +int vb2_core_delete_buf(struct vb2_queue *q, unsigned int index)
> >>>>>> +{
> >>>>>> +       struct vb2_buffer *vb;
> >>>>>> +
> >>>>>> +       vb =3D vb2_get_buffer(q, index);
> >>>>>> +       if (!vb) {
> >>>>>> +               dprintk(q, 1, "invalid buffer index %d\n", index);
> >>>>>> +               return -EINVAL;
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       if (vb->state !=3D VB2_BUF_STATE_DEQUEUED) {
> >>>>>> +               dprintk(q, 1, "can't delete non dequeued buffer in=
dex
> >>>>>> %d\n", index);
> >>>>>> +               return -EINVAL;
> >>>>>> +       }
> >>>>>> +
> >>>>> I know the driver could implement its own
> >>>>> v4l2_ioctl_ops->vidioc_delete_buf() that check whether a buffer is
> >>>>> used by the hardware as a future reference frame.
> >>>>> But I think we need a flag to let the user know which buffer is sti=
ll
> >>>>> used by the hardware.
> >>>>> Alternative ref case is safe, we only know it's existing when it is
> >>>>> dequeued in current V4L2 buffer mechanism.
> >>>>> While the Golden reference frame, such long term reference frame co=
uld
> >>>>> last much longer.
> >>>> It is up to userland stack to know frames life time, it got the
> >>>> information for that.
> >>> That is true for the stateless codec driver.
> >>>
> >>> While application for stateful decoder could never do that. It also
> >>> breaks what the document said:
> >>>
> >>> "The backing memory of |CAPTURE| buffers that are used as reference
> >>> frames by the stream may be read by the hardware even after they are
> >>> dequeued. Consequently, the client should avoid writing into this mem=
ory
> >>> while the |CAPTURE| queue is streaming. Failure to observe this may
> >>> result in corruption of decoded frames."
> >>>
> >>>>>> +       if (vb->planes[0].mem_priv)
> >>>>>> +               call_void_vb_qop(vb, buf_cleanup, vb);
> >>>>>> +
> >>>>>> +       /* Free MMAP buffers or release USERPTR buffers */
> >>>>>> +       if (q->memory =3D=3D VB2_MEMORY_MMAP)
> >>>>>> +               __vb2_buf_mem_free(vb);
> >> Here is another problem for the existing application, the mmap() from =
the
> >> mmap offset or exportbuffer fd would not create a reference to buffer =
in
> >> this step(while the exportbuffer would create one itself).
> >>
> >> When you delete a buffer, you may not release it from its virtual memo=
ry
> >> space, leaving a corrupted virtual memory space.
> > What do you mean? __vb2_buf_mem_free() doesn't unconditionally free the
> > memory, it just decrements a reference counter.
>
> struct dma_buf_ops->mmap() may not increase a reference to its buffer.

Both V4L2 mmap() and DMA-buf mmap() of buffers exported from V4L2
would increase a reference to the buffer. They both lead to
vb2_{dc,sg,vmalloc}_mmap() which open the VMA, which in turn calls
vb2_common_vm_open() that increases the buffer refcount.

Best regards,
Tomasz

>
> While struct vb2_mem_ops->get_dmabuf() would.
>
> > The VMA holds its own,
> > so the buffer is only fully released when the application calls
> > munmap().
>
> DELETE_BUF ioctl() didn't answer to this problem. Should the DELETE_BUF
> ioctl() make the no other user could access to this.
>
> >
> > Best regards,
> > Tomasz
> >
> >> Also this behavior is
> >> right, because mmap(2) says:
> >>
> >> "After  the  mmap()  call has returned, the file descriptor, fd, can b=
e
> >> closed immediately without invalidating the map=E2=80=90ping."
> >>
> >>>>>> +       else if (q->memory =3D=3D VB2_MEMORY_DMABUF)
> >>>>>> +               __vb2_buf_dmabuf_put(vb);
> >>>>>> +       else
> >>>>>> +               __vb2_buf_userptr_put(vb);
> >>>>>> +
> >>>>>> +       vb2_queue_remove_buffer(q, vb);
> >>>>>> +       kfree(vb);
> >>>>>> +
> >>>>>> +       dprintk(q, 2, "buffer %d deleted\n", index);
> >>>>>> +       return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>>    /*
> >>>>>>     * vb2_start_streaming() - Attempt to start streaming.
> >>>>>>     * @q:         videobuf2 queue
> >>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> index 724135d41f7f..cea666c17b41 100644
> >>>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >>>>>> @@ -751,6 +751,12 @@ int vb2_prepare_buf(struct vb2_queue *q, stru=
ct
> >>>>>> media_device *mdev,
> >>>>>>    }
> >>>>>>    EXPORT_SYMBOL_GPL(vb2_prepare_buf);
> >>>>>>
> >>>>>> +int vb2_delete_buf(struct vb2_queue *q, struct v4l2_buffer *b)
> >>>>>> +{
> >>>>>> +       return vb2_core_delete_buf(q, b->index);
> >>>>>> +}
> >>>>>> +EXPORT_SYMBOL_GPL(vb2_delete_buf);
> >>>>>> +
> >>>>>>    int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buf=
fers
> >>>>>> *create)
> >>>>>>    {
> >>>>>>           unsigned requested_planes =3D 1;
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>> b/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>> index f81279492682..80ace2e1e932 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>>>>> @@ -720,6 +720,7 @@ static void determine_valid_ioctls(struct
> >>>>>> video_device *vdev)
> >>>>>>                   SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF,
> >>>>>> vidioc_prepare_buf);
> >>>>>>                   SET_VALID_IOCTL(ops, VIDIOC_STREAMON,
> >>>>>> vidioc_streamon);
> >>>>>>                   SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF,
> >>>>>> vidioc_streamoff);
> >>>>>> +               SET_VALID_IOCTL(ops, VIDIOC_DELETE_BUF,
> >>>>>> vidioc_delete_buf);
> >>>>>>           }
> >>>>>>
> >>>>>>           if (is_vid || is_vbi || is_meta) {
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>> b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>> index a858acea6547..1c737279d3ef 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>>> @@ -2156,6 +2156,15 @@ static int v4l_prepare_buf(const struct
> >>>>>> v4l2_ioctl_ops *ops,
> >>>>>>           return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
> >>>>>>    }
> >>>>>>
> >>>>>> +static int v4l_delete_buf(const struct v4l2_ioctl_ops *ops,
> >>>>>> +                         struct file *file, void *fh, void *arg)
> >>>>>> +{
> >>>>>> +       struct v4l2_buffer *b =3D arg;
> >>>>>> +       int ret =3D check_fmt(file, b->type);
> >>>>>> +
> >>>>>> +       return ret ? ret : ops->vidioc_delete_buf(file, fh, b);
> >>>>>> +}
> >>>>>> +
> >>>>>>    static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
> >>>>>>                                   struct file *file, void *fh, voi=
d
> >>>>>> *arg)
> >>>>>>    {
> >>>>>> @@ -2905,6 +2914,7 @@ static const struct v4l2_ioctl_info
> >>>>>> v4l2_ioctls[] =3D {
> >>>>>>           IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands,
> >>>>>> v4l_print_freq_band, 0),
> >>>>>>           IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info,
> >>>>>> v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match))=
,
> >>>>>>           IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl,
> >>>>>> v4l_print_query_ext_ctrl, INFO_FL_CTRL |
> >>>>>> INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
> >>>>>> +       IOCTL_INFO(VIDIOC_DELETE_BUF, v4l_delete_buf,
> >>>>>> v4l_print_buffer, INFO_FL_QUEUE),
> >>>>>>    };
> >>>>>>    #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
> >>>>>>
> >>>>>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl=
.h
> >>>>>> index edb733f21604..2f232ed884c7 100644
> >>>>>> --- a/include/media/v4l2-ioctl.h
> >>>>>> +++ b/include/media/v4l2-ioctl.h
> >>>>>> @@ -163,6 +163,8 @@ struct v4l2_fh;
> >>>>>>     *     :ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
> >>>>>>     * @vidioc_prepare_buf: pointer to the function that implements
> >>>>>>     *     :ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
> >>>>>> + * @vidioc_delete_buf: pointer to the function that implements
> >>>>>> + *     :ref:`VIDIOC_DELETE_BUF <vidioc_delete_buf>` ioctl
> >>>>>>     * @vidioc_overlay: pointer to the function that implements
> >>>>>>     *     :ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
> >>>>>>     * @vidioc_g_fbuf: pointer to the function that implements
> >>>>>> @@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
> >>>>>>                                     struct v4l2_create_buffers *b)=
;
> >>>>>>           int (*vidioc_prepare_buf)(struct file *file, void *fh,
> >>>>>>                                     struct v4l2_buffer *b);
> >>>>>> +       int (*vidioc_delete_buf)(struct file *file, void *fh,
> >>>>>> +                                struct v4l2_buffer *b);
> >>>>>>
> >>>>>>           int (*vidioc_overlay)(struct file *file, void *fh, unsig=
ned
> >>>>>> int i);
> >>>>>>           int (*vidioc_g_fbuf)(struct file *file, void *fh,
> >>>>>> diff --git a/include/media/videobuf2-core.h
> >>>>>> b/include/media/videobuf2-core.h
> >>>>>> index 080b783d608d..0f9e68f76b77 100644
> >>>>>> --- a/include/media/videobuf2-core.h
> >>>>>> +++ b/include/media/videobuf2-core.h
> >>>>>> @@ -840,6 +840,15 @@ int vb2_core_create_bufs(struct vb2_queue *q,
> >>>>>> enum vb2_memory memory,
> >>>>>>     */
> >>>>>>    int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int inde=
x,
> >>>>>> void *pb);
> >>>>>>
> >>>>>> +/**
> >>>>>> + * vb2_core_delete_buf() -
> >>>>>> + * @q: pointer to &struct vb2_queue with videobuf2 queue.
> >>>>>> + * @index:     id number of the buffer.
> >>>>>> + *
> >>>>>> + *  Return: returns zero on success; an error code otherwise.
> >>>>>> + */
> >>>>>> +int vb2_core_delete_buf(struct vb2_queue *q, unsigned int index);
> >>>>>> +
> >>>>>>    /**
> >>>>>>     * vb2_core_qbuf() - Queue a buffer from userspace
> >>>>>>     *
> >>>>>> diff --git a/include/media/videobuf2-v4l2.h
> >>>>>> b/include/media/videobuf2-v4l2.h
> >>>>>> index 88a7a565170e..3beeb4c735f0 100644
> >>>>>> --- a/include/media/videobuf2-v4l2.h
> >>>>>> +++ b/include/media/videobuf2-v4l2.h
> >>>>>> @@ -114,6 +114,17 @@ int vb2_create_bufs(struct vb2_queue *q, stru=
ct
> >>>>>> v4l2_create_buffers *create);
> >>>>>>     */
> >>>>>>    int vb2_prepare_buf(struct vb2_queue *q, struct media_device *m=
dev,
> >>>>>>                       struct v4l2_buffer *b);
> >>>>>> +/**
> >>>>>> + * vb2_delete_buf() - Delete the buffer from the queue
> >>>>>> + *
> >>>>>> + * @q:         pointer to &struct vb2_queue with videobuf2 queue.
> >>>>>> + * @b:         buffer structure passed from userspace to
> >>>>>> + *             &v4l2_ioctl_ops->vidioc_delete_buf handler in driv=
er
> >>>>>> + *
> >>>>>> + * The return values from this function are intended to be direct=
ly
> >>>>>> returned
> >>>>>> + * from &v4l2_ioctl_ops->vidioc_delete_buf handler in driver.
> >>>>>> + */
> >>>>>> +int vb2_delete_buf(struct vb2_queue *q, struct v4l2_buffer *b);
> >>>>>>
> >>>>>>    /**
> >>>>>>     * vb2_qbuf() - Queue a buffer from userspace
> >>>>>> diff --git a/include/uapi/linux/videodev2.h
> >>>>>> b/include/uapi/linux/videodev2.h
> >>>>>> index aee75eb9e686..31bba1915642 100644
> >>>>>> --- a/include/uapi/linux/videodev2.h
> >>>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>>> @@ -2702,6 +2702,8 @@ struct v4l2_create_buffers {
> >>>>>>    #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct
> >>>>>> v4l2_dbg_chip_info)
> >>>>>>
> >>>>>>    #define VIDIOC_QUERY_EXT_CTRL  _IOWR('V', 103, struct
> >>>>>> v4l2_query_ext_ctrl)
> >>>>>> +#define VIDIOC_DELETE_BUF      _IOWR('V', 104, struct v4l2_buffer=
)
> >>>>>> +
> >>>>>>
> >>>>>>    /* Reminder: when adding new ioctls please add support for them=
 to
> >>>>>>       drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>>>>> --
> >>>>>> 2.39.2
> >>>>>>
> >>> --
> >>> Hsia-Jun(Randy) Li
> >>>
> >> --
> >> Hsia-Jun(Randy) Li
> >>
> --
> Hsia-Jun(Randy) Li
>
