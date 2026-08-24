Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91339372B3D
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611317; cv=none; b=pVoLYBXEJbSUqwg3hEEKaEf0C2iOMfp19z8vP/C1aovTFLgu68LFDpA7wx2i670SB9YUqUjHN3d/ApddQKhvuXRAuNj5a3i0dF/gcjMDJlfxVAiw9S9Wsw8eO6Ia0kswl46qjt7TCXxNKZtVrvEOTfvAyQN1Uk41WpIiJYfS0a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611317; c=relaxed/simple;
	bh=oYfU5aLvDnWbmh0CEffxJ9VKbVYIz7VzL68X1kCYcgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=em2028EaaL6Hw7ZrQ/ZbAILUhxJ6kEh6I9TRkdtk2ZBaBEDssJwpWih6iL8ZA9Af6D9/8LVBFIJrEE7gEenfT30gS+W+xo/EJpwvi5Uvnp1H2eSmdhg7fwALF4f+kOs8iy8f7k436DKM16ivD2iMLLUkzMCWebkupHcuWMG9pVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=OV1X63LC; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="OV1X63LC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1787611306; x=1788216106; i=christian@themurphys.eu;
	bh=tmek9TDQX8eGppIZURyh2wlMGK/dz47iZjgHPermhIw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OV1X63LCL1H0/OmXnJfWvjpwGRPobpag1ozCijXeqDgzMa4GhhoIQOn+i9yamNXr
	 IFwhwMI19i1YAgrj0+02kO9whHc8o4C8GY0gPZmQnxVaxMWg9WTbDdJNCwjcoR5to
	 TFho/H0M/Vf6uCm7yPOjxparDVjlrGibhSnbTh20E4J7fLm/X5Jo9YZnJCmdxZDU3
	 hmtNGh2qpCTwdD7+m3+RV38mhsXCsaQd4F2mdNazua7CijIwMToDJUVigsiHbrEtu
	 3lPn6wu5zP7neGwAsxXAjIdVJhIvc0nVWv94fsMkQYgs2ZBCHYPFzV05/bg45dnYS
	 nCUzjS9yh3mcrDfIXg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue010
 [213.165.67.103]) with ESMTPSA (Nemesis) id 1MdNoW-1wPIXi31pw-00l2fQ; Tue, 25
 Aug 2026 00:41:46 +0200
From: Christian Murphy <christian@themurphys.eu>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	bingbu.cao@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Murphy <christian@themurphys.eu>
Subject: [PATCH] media: staging/ipu7: Synchronize capture buffers at the vb2 boundaries
Date: Mon, 24 Aug 2026 23:41:39 +0100
Message-ID: <20260824224139.21256-1-christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BGV38A3rAS0qqgU+5n64jGeHhBJ32SVZXthudpwqxEcysremA2P
 zYtNT5I9bNO5K6UtRvPhFS5M5C/KX4VQueLLoP8tL3O445vWXXz8Vk/MpyjX/h97UvT1UyK
 RPYrbzF1gHKc3MVY9j8RBGYCjGVk8VSsMFxgRBTQTxpokGimORbc/vma+qeT9EgBinZn02J
 SAJuvUT0Qj80JOLr0kMKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iX1/N1glfLg=;BcZ5/Suds3LDEHBZVHZiUkwtdPV
 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
 4S6PiuKOXVcePATQmmU/4DuacRL3IhurymKCsCw=

IPU7 captures into cached videobuf2-dma-sg buffers. On x86,
dma_sync_sgtable_for_device() and dma_sync_sgtable_for_cpu() do not perfor=
m
cache maintenance, so neither ownership transition invalidates cached fram=
e
data.

The failure follows the buffer pool rotation. In raw captures, 7.3% of eac=
h
frame was bit-identical to the frame four positions earlier. Other lags ha=
d
no excess matches. Four was the libcamera buffer count. Last-level cache
eviction removed 97.2% of the excess. Flushing immediately before the
consumer read the buffer removed 98.9%. The stale 64-byte lines appeared a=
s
orange and blue horizontal dashes around moving objects.

The driver already uses ipu7_dma_sync_sgtable(), backed by
clflush_cache_range(), for firmware, boot, and syscom memory. Call it from
buf_prepare and buf_finish, the videobuf2 CPU-to-device and device-to-CPU
ownership boundaries.

The prepare-side flush is required. vb2_dma_sg_alloc_compacted() allocates
with GFP_KERNEL | __GFP_ZERO, leaving dirty cache lines that can later be
written back over captured data. Userspace can also write to MMAP buffers
between captures.

Do not flush in the completion path. isys_isr runs from the hardirq handle=
r
ipu_buttress_isr and holds isys->power_lock while it calls
ipu7_isys_queue_buf_done(). Flushing about 66,000 cache lines for a 4.2 MB
buffer there would run in hardirq context with a spinlock held. buf_finish
moves the work to process context during DQBUF.

ipu7_dma_sync_sg() uses sg_virt(), so every scatterlist entry must have a
permanent kernel mapping. That was true for existing driver-owned callers,
but the capture queue also supports imported DMABUFs. Validate the table i=
n
buf_init before either sync callback can run. Return -EFAULT for unmappabl=
e
entries. Check orig_nents because ipu7_dma_sync_sgtable() flushes that set=
,
rather than the mapped nents set.

This rejects DMABUF imports backed by page-less or highmem scatterlists.
Those imports cannot safely use the required flush. Reviewers may prefer t=
o
remove VB2_DMABUF support until such imports can be synchronized.

The flush averaged 217 us per ownership boundary for a 4.2 MB buffer over
47 passes (145 us minimum, 389 us maximum). At 57.8 fps and two passes per
frame, the calculated cost is 2.5% of one core.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device dr=
iver")
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2502786
Assisted-by: OpenAI-Codex:gpt-5.6-sol
Assisted-by: Claude-Code:claude-fable-5
Signed-off-by: Christian Murphy <christian@themurphys.eu>
=2D--

Notes:
    Equivalent modules were tested on a ThinkPad X1 Carbon Gen 14 with Deb=
ian
    linux 7.1.8-2. Six 24-frame raw captures, split across a suspend/resum=
e
    cycle, had at most one excess lag-4 block per frame pair. A processed
    1920x1088 qcam preview had no visible corruption.
   =20
    v4l2-compliance 1.32.0 passed on the connected path: /dev/video0 58/58=
, the
    IMX471 subdevice 54/54, and /dev/media0 8/8, with no warnings. A full =
media
    walk had 112 existing failures on unsupported source pads of three
    unconnected CSI2 bridges.
   =20
    The submitted patch applies to media-committers next at the base commi=
t and
    builds the IPU7 driver with W=3D1. The DMABUF import path was not test=
ed.
   =20
    The cost measurement used ktime_get_ns() immediately around the sync c=
all.
    Timer overhead was 36 ns. The 47 steady-state samples exclude the init=
ial
    prepare and teardown finishes. The single initial prepare took 359 us.
   =20
    IPU6 has the same missing capture-buffer synchronization, but no IPU6
    hardware was available for testing.
   =20
    No Cc: stable is included because this driver is in staging.

 drivers/staging/media/ipu7/ipu7-isys-queue.c | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-queue.c b/drivers/stagin=
g/media/ipu7/ipu7-isys-queue.c
index 434d9d9c7158..9a829e1705bb 100644
=2D-- a/drivers/staging/media/ipu7/ipu7-isys-queue.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-queue.c
@@ -29,6 +29,26 @@
=20
 #define IPU_MAX_FRAME_COUNTER	(U8_MAX + 1)
=20
+static int ipu7_isys_check_sgtable(struct ipu7_isys *isys, struct sg_tabl=
e *sgt)
+{
+	struct device *dev =3D &isys->adev->auxdev.dev;
+	struct scatterlist *sg;
+	unsigned int i;
+
+	/* Validate every entry ipu7_dma_sync_sgtable() will later flush. */
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
+		struct page *page =3D sg_page(sg);
+
+		if (!page || PageHighMem(page)) {
+			dev_err_ratelimited(dev,
+					    "sg[%u] has no permanent kernel mapping\n", i);
+			return -EFAULT;
+		}
+	}
+
+	return 0;
+}
+
 static int ipu7_isys_buf_init(struct vb2_buffer *vb)
 {
 	struct ipu7_isys *isys =3D vb2_get_drv_priv(vb->vb2_queue);
@@ -38,6 +58,10 @@ static int ipu7_isys_buf_init(struct vb2_buffer *vb)
 		vb2_buffer_to_ipu7_isys_video_buffer(vvb);
 	int ret;
=20
+	ret =3D ipu7_isys_check_sgtable(isys, sg);
+	if (ret)
+		return ret;
+
 	ret =3D ipu7_dma_map_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
 	if (ret)
 		return ret;
@@ -82,6 +106,20 @@ static int ipu7_isys_queue_setup(struct vb2_queue *q, =
unsigned int *num_buffers,
 	return 0;
 }
=20
+static void ipu7_isys_buf_sync(struct vb2_buffer *vb)
+{
+	struct ipu7_isys *isys =3D vb2_get_drv_priv(vb->vb2_queue);
+	struct sg_table *sgt =3D vb2_dma_sg_plane_desc(vb, 0);
+
+	/*
+	 * Device writes do not invalidate the CPU cache and the DMA API
+	 * sync helpers do no cache maintenance on x86. Flush dirty
+	 * lines before the device writes the buffer and stale lines
+	 * before userspace reads it.
+	 */
+	ipu7_dma_sync_sgtable(isys->adev, sgt);
+}
+
 static int ipu7_isys_buf_prepare(struct vb2_buffer *vb)
 {
 	struct ipu7_isys_queue *aq =3D vb2_queue_to_isys_queue(vb->vb2_queue);
@@ -99,10 +137,16 @@ static int ipu7_isys_buf_prepare(struct vb2_buffer *v=
b)
 	dev_dbg(dev, "buffer: %s: bytesperline %u, height %u\n",
 		av->vdev.name, bytesperline, height);
 	vb2_set_plane_payload(vb, 0, bytesperline * height);
+	ipu7_isys_buf_sync(vb);
=20
 	return 0;
 }
=20
+static void ipu7_isys_buf_finish(struct vb2_buffer *vb)
+{
+	ipu7_isys_buf_sync(vb);
+}
+
 /*
  * Queue a buffer list back to incoming or active queues. The buffers
  * are removed from the buffer list.
@@ -790,6 +834,7 @@ static const struct vb2_ops ipu7_isys_queue_ops =3D {
 	.queue_setup =3D ipu7_isys_queue_setup,
 	.buf_init =3D ipu7_isys_buf_init,
 	.buf_prepare =3D ipu7_isys_buf_prepare,
+	.buf_finish =3D ipu7_isys_buf_finish,
 	.buf_cleanup =3D ipu7_isys_buf_cleanup,
 	.start_streaming =3D start_streaming,
 	.stop_streaming =3D stop_streaming,

base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
=2D-=20
2.53.0

