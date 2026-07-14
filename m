Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531433EC2F6
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013839; cv=pass; b=ev2/yQzWW4S+hI6vjUc46uCBNCi/ADX46lySN9/vZrzfHiD66KQ8JCV3kdCXzQ3ZBzWeD7kdnpyz/yRNz20CGzgsdm8u5c3z4AIeDLIMg23G0Q01hpS3aehFPmW2YIki2IASuAf/HuA1mZjeTbVbM7aRlygiuH75+fT2YBRNZa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013839; c=relaxed/simple;
	bh=UpfozN3EwKE3mwnRPUAc2uAXRnO6CkpDnAeOhOziE+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6cZjDfg6HWlZnXUMemQAGhou0BYA2UMwuOqe5wDmruwFNvmPidVinm6gVL06hSnzopmB//ygN+M4namQpMqMTSs3ZgggJuE+zOm9YyYjmBd0fOc858dotsp/tNq1LSl1DuXgYu3TaHRsauVXB2vP/Cszd9fWv33pQkqjaNZRkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/WNPTBd; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/WNPTBd"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so7180852a12.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013837; cv=none;
        d=google.com; s=arc-20260327;
        b=AtG+y1TlzyZzKUK3X2yaBSBx+2ELUH6o2sdKTUF/RY8ovIbmsqp70T5x/HuSuoztqF
         GuquNJEJ04AYytsP7gjLDcoMmiAXNyfYRSeJlxlFZibs2IoQ0urBTqOi2/zWXjg7ofN4
         C+79nqDHihc7WQ98Vch2zKbM+OYuVEK/NmiRfsyB/t5BX6wRpuW4eaSPqlrVARgFRb96
         fBWXG1QeG7J52mgOpxTCQriFqyMl9AwDNkdPIgvjwix7c5yyQouuSqPa896x3P1J/cgX
         Eblcm13LhBpLs/5bdDLA7Rviha7RM6wsqg2B6FRdjr9obRSe98mQggGvuBtVHBs9fdyr
         98Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        fh=sig8qYYJ9WQWVSEhKsQy9k/TbzQyfoewWPgUL67jzTQ=;
        b=pu/3I1SvI/VZsL+LklIDgXMWCpSGuKyqxhMQ6ycVEISxrk06bNDI1ezRkqKAyFJQxW
         BDOpP/pl403fhYMePs/7Bv9HCUetWkkCD/20pnJ7pQItI3O0m/Gmh9pgt8cuHqb2ybQZ
         Yx5TvsFOgHpEgm+8KnHJ85HTY8i0CcuM5mphh8zMKEDBSRbPmPNpDn9b69W+8YAhrheW
         pBYthaZS+r/J4EmL1AyxnaoNFI6/QBxYCCOHnk4q3fCTsMz7ZEZDyDHOyTUYhej/E+SS
         4gQZTGVgrPn8JRV+UhqYp7WtAeGtGlrVNqEEZlNIhnJMQt7Z+2w5yVCYLi9CVSSuhjKJ
         NAxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013837; x=1784618637; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=C/WNPTBdK4JBOo2Nj+WnnYIix62QJiMbw/EZhwlDhLlPer8kX0gmmuGboNX1+6T8BQ
         wZBb6WhKzJObsDwCBEoe17svwx1puk5pYpbZcw8WVOtrHS7KeiIIiTBwJ0obAuMraC3K
         JpEDGToYNU3GeXPQFyxZiezmiJG4Dt6MJLRty2pR+5CpU3TOpv/xnlfIWW2yJKRIKTzv
         YQtrvxreAjI943DbVAK9296hbI9R+BeGJ66O4rDuVydL8dRovns0ppdr0+rBpDjec+fF
         2FB2LlTs/lqP2LJHoAv+MWE7li38smZDfDD3hAiztjRRleGPbTbIG83TtMlY9hfij3Oi
         axkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013837; x=1784618637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=rhgVvRBKWIPVsoD2v445W5kZe3/foKphNn2v4VSkF2fhsr2skzBvxKwcL7EbUf30nh
         Y1aeeOshpIguAVHaaZ8rdkjMIeEkzqO8T419ETMDQb9XjNhUsh4FaHPOHeXOfatzx6KN
         TN0qYw1RckGbxARUrCgmznFXF2W7Z5d/x6YPKP7FhHn35QqhOk6MJONjTB+Q72wUycDs
         1yc7zBgUDmK9A+mFio43jPMHO7D/Wz0EnrIgsN5VxFKcyX9LCjai4xazVbof1k+glAff
         eui5G4RJOQNX4yzu/hNVrGqWz6Hv97yPQjWaeK59yqwoOkyauAq3VpKB8aWphmuitPQn
         XM5w==
X-Forwarded-Encrypted: i=1; AHgh+RrEc/hSt2nKuWHNgpEysxp9KUYlZaA/9xZuhv4ceCa3mOigFoQjRLYzMegsfuvkV6RWmdh+EPTkJ/cOt4HK@lists.linux.dev
X-Gm-Message-State: AOJu0YziZoormczf9qutNFS9+e72XKhWuZS+RK1MZ/11QBIKbSiXPOsW
	Qn/+cMqXzClK0nMt3lZNFTzykNBzKncS0ZjpnW8HXGJMgGQvafjvg2sgN8xk1HlVATBIsmpuqMx
	m/xJbtLqju4KciS3BWGity2IwOepBX6s=
X-Gm-Gg: AfdE7cnhkeOGcqYLVRvAPtxP0iSpO/QeDBFmY60IDJ4jnfZAx00xdkhKwtdihlOkfFL
	5cvi6t60kqTlVRVtOqsWCBOvxyapvi2u44eGYWw3d3H+Jme2cKhtd2BdhyW5G+lkaNXvTYe2kR4
	5pWPKfyA5YXgYLmHdAm4wZdP8ehIxzdRZGWgs5Y4jr1ESLUzkntc67sVFaSeIiTbr13qUAvtnUB
	ilj+vS/+LX4cc3GtRd8yzIKydl0b+7DXaTkYgyRFpn4RsGY3iFuHq++YT1y1XvYagbe65cWzHf8
	Ryjt1w==
X-Received: by 2002:a05:6402:e94:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-69cd2a001acmr1004913a12.10.1784013836409; Tue, 14 Jul 2026
 00:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713120840.17427-1-linux.amoon@gmail.com>
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2026 12:53:43 +0530
X-Gm-Features: AUfX_mzvXnkQt9N3uwj4z53r62LfKGSebrr5Wzfs3imVuOH5yaZKNS9xAf_UWqU
Message-ID: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch series addresses a collection of critical race conditions,
> memory leaks, use-after-free bugs, and resource management issues
> within the Amlogic Meson video decoder (meson-vdec) driver and
> associated components.
>
> The primary focus is tightening session lifecycles, safely synchronising
> the V4L2 m2m framework callbacks, hardening work queue operations
> (esparser_queue_work), and correcting buffer validations to prevent
> stability issues like KASAN out-of-bounds errors or stream-on timeouts.
>
> Summary of Changes:
> * Race Conditions & Synchronisation: Fixes multi-threading and
>   execution races across stream-on, stream-off, job abort, and
>   teardown pathways.
> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>   vulnerabilities by safely pinning, canceling, and sequencing
>   device removals.
> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>   parser, properly tracks ongoing buffers via atomic counters, and
>   prevents invalid memory writes.
> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>   canvas handling, and buffer sizes to match modern hardware demands.
>
> Note on an outstanding issue:
> An execution deadlock occurs in the driver workqueue path during high
> stress or long playback sessions. This stall is triggered when the
> Amlogic hardware internal video FIFO buffer becomes completely full.
> When esparser_queue_all_src runs, the capacity validation check is
> tripped due to a design limitation in how buffer exhaustion is handled.
> This blocks progress and leaves the workqueue worker waiting indefinitely
> on a core mutex lock.
>
> The resulting hung task call trace shows the worker thread blocking
> on the internal lock:
>
> Workqueue: events esparser_queue_all_src [meson_vdec]
> ...
> __mutex_lock
> mutex_lock_nested
> esparser_queue_all_src
>
> I have tried to address this issue, but the underlying deadlock persists
> under extreme conditions.
>
> Any feedback on this new appock is welcome.
>
> Testing was done using v4l2-compliance and active decoding pipelines
> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>
> The v4l2-compliance tests passed successfully via:
> $ v4l2-compliance -s -v -d /dev/video0
>
> Pipelines were validated using the following GStreamer script.
>
> [1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>
> Previous changes:
> v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>

I will review Sashiko's feedback. I will look into these suggestions and
work on incorporating them to improve the code quality

> Thanks
> -Annad
>
Thanks
-Anand
