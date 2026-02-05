Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355F13D638
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 04:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770266253; cv=none; b=PJtK156vQFWw+8yR2tCsYdVZfGsSDLwzMoslhFKrFmjuTtDzakxBvL5+kPKxl55+Da6y38/X9qyd1KZvbNx88ouvU0mMHNAT4EYB6/ryBkCwydWomO6jpY1p0+Dyn/4nk5ENQVN3m+xNaF4Up6dJ4/C8NggLbxZkL/HHu/s8J7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770266253; c=relaxed/simple;
	bh=UnrAmmSbaRoksWNGky3SSS1vkAjebM2z+IvCmTfQyE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sK6XtUuqcYoOCIxegNGuKAlKCC2aJB7uXciLo+g9JWIlCqbNcsiKpXNGqMaxsSq/UfXrhQ2Frs4J8uM6cqYR5z0koZI8dRpqMcZwCMRqGGP0xBll3Kx6ijlmaxoLh8NQ1MR3ABvAUsue6H+1DvNbrBIHw0zif/nqudEmN0bvg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=xcyoDdIt; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="xcyoDdIt"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7cfcb46ffc9so898064a34.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770266252; x=1770871052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ3frmblWiygOYmfj4eESIem1C0eBPRtCJOntjI5VdM=;
        b=xcyoDdItK+0Lce8W2Yxlq+88hbky7OaPwFDrQ4e6fKuhNU3JRzlzE5nn9EEbuXZw69
         34kLzzOV+dA7MyUGM6CN1/phgxUKZ9r3mnf5+AxINuGtA5qyWs2vRuG4qdgVGPwb1kFK
         M29Yf9/HzndTwt2DFEXHHsUYTYtM5hC7gbLBnBxLK/iaWM5J/I4pS+J10xLpR3a2guyd
         sO+JD/hbYQnSuEuENM+EbDejdsr4E4rsO69ALGeTaYmmgRXgFtBiLPKUTXYWzcBzS1Ik
         eKl8AOVc83qWqCFJb0fcrtJHIb+f8m6JHQZ00x0ldbuCf3Ust74q+5pQYl7ZuEbzT2+a
         P9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770266252; x=1770871052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ3frmblWiygOYmfj4eESIem1C0eBPRtCJOntjI5VdM=;
        b=pC8T6/obmwlJ4YPQ00zHFDK42o1PUEL/I7e6ZCbGAoHhcosfKVkcX2rMxh0MU8Y8tO
         s9MKXgQzL3YosqPIWIa1Hi7qr6MK4ZxpnKX3BEXg3WubL51BpKJ92/jB9d6MpXpI1Bm8
         KnQ0TscRzUYfnyQ1H+cHOu2Ac0ntvdm0icvAZfhD2VfIXX+/mWlRSY2k9x0RwiouODkX
         4LeaY+656LbDKm+snopgDF/Vt3uwWmOZTNUUhlYA7U0DlLKoILgPuWlC26EEvzs3z5M8
         +B43ublMDDK/Lq9Ay3x2GpoxJrLBtsB1ArFE9J6ZQpnvaqNpna6moxkqR2Ap8rcJ9bEp
         Eh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAdh9R6Md/5QJ1OeDUW9fCOg+Gh1MynJTAtUNSAiLjzIenXKC21b3aWVg86lUILSYuqgZGRXulVQtg5T8M@lists.linux.dev
X-Gm-Message-State: AOJu0YwApz1LocI3hL6BSFXpWpFYNltY4MI7AvfQmYJ/60RPtxtvkfnR
	XsDDj6SjY0CyorIJD8fxB9rJzFhWlxxbyz/FjICPyjTPXJ6FSGHngLzX7WtP4qfprew=
X-Gm-Gg: AZuq6aJpTiFB5Nc56FFiTSPRX4Ol6tax4x+1iYwabz06sOJ68LyTKmg+2sEWHMys+Su
	RxmQX3rr6ebJctP/e9pppYk40fzAxwvxRyMUX1JZEW96zHnVZAk9WVtt0l4e5adAhjqXUtmrEik
	OjELCsNsqZrM+KrcPCzV6PYn40lKnAvx68ySUEu7hwCA0jWZsyH/a8H9Yir9u17NUMSavCUHJAQ
	Sa6jALTmc+gPlsHfL6gdX2kKeIiQWQsK0lAea7BnfDH4RJd89y7wAYyMe12SSW5bUE4HvcRlEDD
	D9/x2SYTNpan+hg/08x9l1HWgF321m5QjpkYwVR3i8qZ+SBzHdkRPulIwLAXYFCloQ+TCwThxms
	8I3bCDYEiVwc7UN+tUK1lGmBoZ2zZRFr3QeHVUxUboG3CipDFF2X5JYljjqFuMbAUQXPkyP/tZ+
	1bH0087edS+q8sZ9he0UIj3v2CtaZND/i931Y27dQWsSuMsTVk2bgwCoGSjLIYLBJVENxCTjOty
	QuaLSurd5DAiiaOX5lb60toxrwR5qM=
X-Received: by 2002:a05:6820:468c:b0:65f:6c48:7860 with SMTP id 006d021491bc7-66bac25b5c3mr775281eaf.9.1770266252383;
        Wed, 04 Feb 2026 20:37:32 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66a33189b90sm2544993eaf.6.2026.02.04.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:37:31 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] media: atomisp: add missing mutex in atomisp_vidioc_default()
Date: Thu,  5 Feb 2026 04:37:30 +0000
Message-Id: <20260205043730.3856488-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_vidioc_default() calls atomisp_exp_id_unlock(),
atomisp_exp_id_capture(), and atomisp_inject_a_fake_event() without
holding isp->mutex. However, all three functions have
lockdep_assert_held(&isp->mutex) indicating callers must hold this lock.

Other ioctl handlers in the same driver (e.g., atomisp_start_streaming)
properly acquire the mutex before operating on ISP state.

Add mutex_lock()/mutex_unlock() around these three ioctl cases to fix the
missing lock protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..ab13630c8149 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1521,10 +1521,14 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		break;
 
 	case ATOMISP_IOC_EXP_ID_UNLOCK:
+		mutex_lock(&asd->isp->mutex);
 		err = atomisp_exp_id_unlock(asd, arg);
+		mutex_unlock(&asd->isp->mutex);
 		break;
 	case ATOMISP_IOC_EXP_ID_CAPTURE:
+		mutex_lock(&asd->isp->mutex);
 		err = atomisp_exp_id_capture(asd, arg);
+		mutex_unlock(&asd->isp->mutex);
 		break;
 	case ATOMISP_IOC_S_ENABLE_DZ_CAPT_PIPE:
 		err = atomisp_enable_dz_capt_pipe(asd, arg);
@@ -1537,7 +1541,9 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_formats(asd, 1, arg);
 		break;
 	case ATOMISP_IOC_INJECT_A_FAKE_EVENT:
+		mutex_lock(&asd->isp->mutex);
 		err = atomisp_inject_a_fake_event(asd, arg);
+		mutex_unlock(&asd->isp->mutex);
 		break;
 	case ATOMISP_IOC_S_ARRAY_RESOLUTION:
 		err = atomisp_set_array_res(asd, arg);
-- 
2.34.1

