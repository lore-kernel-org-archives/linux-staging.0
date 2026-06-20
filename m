Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCC40D582
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781963123; cv=pass; b=a05IDoXUw/IFDtWUEb15V7am4176FJnXUVvCVqMV49u7N760cVuXyWKys9pC5Aicuhnto9nQ9rUXWViJHXLmOLuOPI4bHW83uYN1ih3JKSFMcGQrdGTZJxkS1JLOcyva466rIdwdhTiDOgIzIcu1iglMUVI8EtBmhjv208V7S3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781963123; c=relaxed/simple;
	bh=Wzkfo1PCI6yYI3BNtzflo3vLt1B+B8Ol/QtG8nHmE84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZWK9IczyR60OSewe/pHiI1gVAdCSo4fvwsBCQkyXkMlr4unvYOHhObQR+b1C77lRx80SwCpF5RrWFxbpkjHcC32eFc6NDKDiaBtGU3Khs46zWB68M5tgxHi8J8UppJVLygp9Xg5b5cmfwjxDtXB5Tvrw9srfF1r+bXmg77+nqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqbRSpIi; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqbRSpIi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c07a6527453so370452466b.0
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 06:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781963120; cv=none;
        d=google.com; s=arc-20240605;
        b=CuKpYL4dUhH/tutGxkYhAtfqUr8hBHZD5dJpbS5wmmbzUGSzblUv0utk4t6BNiorIv
         8zh/f1+jG4SuG9BlvWyL2CXYwNcmPDv8aesv4jhvmjQE9WNQDCMcRQsLZNB9a7/rSIbJ
         kYL3Z4SchGeO/MaeuDF7dkCZyXavqRLVSiHVAYY7Qtig0t3wzuFDsvFe3f5H7pyn1rmY
         L82KN2q19JOYiohgfxFvAuyTCP9FJLYHrYTi45EN8XqzQ4pLu7idbtcRiqiGOJ6YnL0j
         LVfdmUGNDQZLHTcmOY5niHCQlFQzaxE5WC8MQFrNR1twGI5cc/nyAeyl5BCO/GxVaNA3
         X9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        fh=Izh9PXETEazNqA0k/ZK2tXiAUpG7SHbUzUipC+VbdaI=;
        b=gN0vAIojHnARC7YdwzaMdia+7b+WDhoiMvBgORXhluZxtBKG73dpNzV5d8CuIStuQ1
         o6CuYe7516NMSiknHma/ByrQ3nFXOVkThnhmC3H4wDJs/E6uJRy/ks/44Fxf/klgzWyg
         CF8g8ZwlEUP/UVgFQSXfqbpFiwF+fT8kZ2K+l1CZyhn+otkRzzjyOMWjf/WHi1aTNpsM
         cSTzQ0Ag2j+AXE8R37A4QrSEvlyPj0XRfmC8PtIb227rQGWRFOAcQrO6TjYBf1CuVXvu
         Npmg0bwJfJD6DcZc9w2kWWqNZfkcmEM/QVULNqFQ5gnuKjDg3fbXaDjbyMPZ/PowpJ31
         T2cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781963120; x=1782567920; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=MqbRSpIiNnSlhlhwKF5wctOecxk0km0AgaeIjtS6VTfvtfr70MNfjt6DieyVKpln5q
         uZTrY2jsN5Ba2BTpYxfalw/RHgOJugtSn1genRWY3XdIq8QfHKma2ZhXfCYe7BatMUUA
         b7PlHJ5HYWZ8BztH+oLDQQL6Tm9Kc8ZLuVMQPmewgEztvCOWHG8gTPtZedOTEh2XoahW
         XSBkk/62ewAzRrRQyBZbCxps2YQ4HqaiD9mE9+hrvdvLjrmI/M0pIZJ/dnf/eOKDCU42
         YZGwlTOxq+kWO7a0IPKOrgirsRW+NrROHCScdwqS3oZnwW7SwZEkWVtfV438ADqeysmc
         IiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781963120; x=1782567920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utXWx3oSNzw96wlO+XOiybZZ9LJhhovVhCeiDDuSymI=;
        b=kqoHMavqSV8MThH4P3eXz4/9XMwrC/tOXAx05vi0KCDC4ERYeby5VCB2zg2VzAnAQc
         QiTAdsOKwpmdS8F4QJ/Eu8PVXULHfC5/6brVL0eFF/ejo6OU2jAr4bvTO24Q4y3EunBb
         a+QRCTl7PjxBcPmEWWixTR/CtOYusMtioLvGjLx2TeXYaZfPUyfKgFkSmCe9+TMa9iwi
         53ZZSwt7AQsBaLIJDnDui+rnhsQ8PL8aVdJtwO6xIObNIPNhtfFzBhUTm2eU6w8euPsG
         Rh8/PlxEQBYT1A47/8uiRkg1by6Wcu6sHHY0Fd4us/sLVyKbYHwan/qEKDQ74NXlYoZ+
         x7aA==
X-Forwarded-Encrypted: i=1; AFNElJ+BmEnMNI9DV4bNx0YMMHfMH9QhRMIaZJ1WivIjouVVrpZw2mkEH2C5ahHxS34EyKUIF4SY9UpaClTtpHO+@lists.linux.dev
X-Gm-Message-State: AOJu0Yy46WGRpYBkhuPLFHH8AEk7RXhLzdtEWECqeoP+zTn3Gqx4bPH0
	PNGXK4R6CJJEvg0EEG7nb8IfiizzQLWbHPIwNt1xPxOQ9LCIoDXVPODcLcXujD5mY86H1SIdXYF
	MI5usw3Y9EOTCJl5TVUrXiEcWLURtMwM=
X-Gm-Gg: AfdE7ckldTw8/Uyk4bNiMSMUN2EsGzQgs/XdXoHy2tbge28omdLB+Z+rbskan+/Z9S3
	U75Xq2J7S/KE+/boFSa5KgA8k1arcXwt/mLGUaF+E2uzquht384gNlZ0P6SnKbdWsc12QtLVraD
	T+tDQ9/dH5/3Hy4J7D1XMGdkeCv59lBSMxPU9wqi5/l2XSoYr0X3vWwiQJF6RKNe+XU25+Oy4s3
	l+okMAeUOlB7VP7ZGgFihRkjLIR1rvBqhaq83U06GGltqVFDs5/sGipV1sDYqk+f5DI62CW9SVR
	j1mAIg==
X-Received: by 2002:a17:907:e110:b0:c0c:63bb:f422 with SMTP id
 a640c23a62f3a-c0c63bbf546mr86176966b.43.1781963119757; Sat, 20 Jun 2026
 06:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616074952.93076-1-doruk@0sec.ai> <20260617074123.32464-1-doruk@0sec.ai>
In-Reply-To: <20260617074123.32464-1-doruk@0sec.ai>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 20 Jun 2026 19:15:04 +0530
X-Gm-Features: AVVi8Ceek5KHZhoQI3N5eXAU25nCx3k1CHygVioQTDscbsZIHW26iKArybAPhdM
Message-ID: <CANAwSgQ0FdonxfZ8V=tPB8rBiyFj3fV-1tqJA0-RN9=AYvoBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work
 in stop/close path
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doruk,

On Wed, 17 Jun 2026 at 13:11, Doruk Tan Ozturk <doruk@0sec.ai> wrote:
>
> Please drop v1 and v2 -- both are wrong, and the sashiko review was right
> about the deadlock.
>
> The underlying bug is real: vdec_close() does kfree(sess) (and
> v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
> sess->esparser_queue_work, whose worker dereferences sess->lock and
> sess->m2m_ctx -> UAF if it is pending/running at teardown.
>
> But cancelling on the streamoff/poweroff path can't work:
>
> 1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
>    takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
>    across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
>    runs under sess->lock; cancel_work_sync() there waits on a worker blocked
>    on that same lock.
>
> 2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
>    power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
>    register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).
>
> The only deadlock-free point I see is vdec_close() (the ->release fop, not
> under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
> still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
> schedule_work()) able to re-arm the worker, and there are adjacent teardown
> issues (esparser_isr() vs the dos_parser_clk disable;
> vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).
>
> I don't have Meson hardware to validate a corrected fix. Is a
> vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
> the direction you'd want, or would you rather take it given the HW testing
> and the surrounding teardown concerns?
>
Actually, I've been working on this issue for a while and have made a few
changes. I really like your approach, so I'd like to integrate
it alongside my cleanup changes. It should solve this issue.

diff --git a/drivers/staging/media/meson/vdec/esparser.c
b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9..c5b909c6a2b7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -375,6 +375,9 @@ void esparser_queue_all_src(struct work_struct *work)
        struct amvdec_session *sess =
                container_of(work, struct amvdec_session, esparser_queue_work);

+       if (READ_ONCE(sess->should_stop))
+               return;
+
        mutex_lock(&sess->lock);
        v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
                if (sess->should_stop)
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 51ea7beef811..de3a660d22b1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -448,6 +448,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
        enum amvdec_status old_status;
        bool full_cleanup = false;

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        /*
         * Secure the hardware lock for the ENTIRE state evaluation
         * sequence to block concurrent start_streaming() callers.
@@ -1000,6 +1003,9 @@ static int vdec_close(struct file *file)
 {
        struct amvdec_session *sess = file_to_amvdec_session(file);

+       sess->should_stop = 1;
+       cancel_work_sync(&sess->esparser_queue_work);
+
        if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
                kthread_stop(sess->recycle_thread);
                sess->recycle_thread = NULL;

> Doruk
>
Thanks
-Anand
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
