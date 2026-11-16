Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854048;
	b=t44xhvSopMEZIOoLhTIM2o0tWr7PiRE+8a9Lv45sjFv+97Fl48iguSZ3Rf67PLFyDT60
	 7YX2QkIJkiwXmvLDNxRHH8hqn0zbl7pg5y9mjOpUTL1l8eCL7EA7z3o1Ytctb1i7GugxI
	 e0gL6AM0fJA3akV6gbx0BKvmHMwlbNAX4yaPXCqTTkjEif7tCIBpi3vlCIqbT7Z26j3rS
	 Lc7b7asYpud7UtpFOCsZ9F+29BI/vYNgnTOL2G4V7t7e3NobGoe8DX0Kp7o7G664NUPZr
	 re9sRrSQJhtOhwQgrSqUTUAnDgcHOca4owF7NU3X5vp3gltO19b4hf3dQAML3oQs3LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
	b=XiJa2mrscT/6OVBTRQo8P9O8S6sJ3gzSCauFsSRYwS3yTGc2nWwuozzlhjxaYT2wMgHW
	 +rrzJrW4n4+ZNEfqWH23eGApMxBSF5BeYOQWQocGxDfiblsVQejfNb89mF+KskzH2DSiE
	 lsqxxd6tK0zV2vvUnjYjQwqQSB70L78MM8yObtoa9A1dH9dmTh1QsWrpunEzWnX0mA1dK
	 QMrzhMeCR9368VbF2Rsy4wyQPhk820dBczs1OCQlBJxjAM8KzuoMLBNptEtlrloNBPEbN
	 2z9urF3HSxKZNLc0ZB5GmLLFYLlndlFzp7hhJH1Kt0UwbuUVnm7lWp57dMbVQ7QK3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6EAhv6C;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9115F606A333
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 18:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9115F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6EAhv6C
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6119383eec.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854048; x=1795458848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
        b=T6EAhv6CUNtKeXiSsLkVU191pDEFyeD75ZIBJlvOqAvuAvYJbb5bHC3ICnFcG7NlZQ
         p5KuphuiC9DJjZ04uKKOLytTCOwJSuEW0z+nEZ9+B214//KB4blUomJcUMd15EN1Ty+d
         73IzfjVbuRjbeNrmG1f+YMGXB/exSfWgzKw2Vum2hujZNDj5Kk93UH1Q6uCUHiJAKCoo
         wOtMxNtk5D9qfCWlMV8pTqhRog6oqQ/TXv5qVqkkvaSDKZ+Lcw450m84aIiHemBUChX4
         XZb7tlh1v4qRPUq/dYJvo7W1/iQGyudjJbPsSgDUChpIzz99VCJpzQuBEkqddCfVb51d
         Xi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854048; x=1795458848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xG49e14ZCh+fO/7DHQykDuVPv0J567RTNrYYSBGnHU=;
        b=Huu8Y1Aok6KlqO0zz/FERs7IRjknkDjEdluVWF0NQj2e9qjPH/CHK4F9+1snyjva5c
         CWUhM3O13pjfJ25DwWKnPErCkPlkKDz+4YOXhDNJSY9y5h+XrMEJUjSoodig2FJLMqaU
         5KjF8E8H8XhPRsbZBcfWWUKM+ZdDUydRYOfGrMBPZojU4WaBP+Fr+hxb2/K81NZoLZak
         6ORAITsfplE7vH3oqORAkI0MpE9fI9ovDwkYg+wlWSlhiJqjbWVd1xQp1CBDieG0rvGk
         BSMnypdZ4cFaiiRO7Z+9Xn3YpUZiDRhnEi/MEF/RLr/MnET7rrX1TDj3XLRdrRxeXS2Q
         kpNQ==
X-Gm-Message-State: APuU4Z8pP+C5krn+hT3icXDuN5xmEsI5rCIiAHLkyOe4z1poCyS6DeWp
	4O9D/xnGWzEge8FtvLj12vdTHWhlpV2D2HEWA2aEZcdxXOlNyhMB/xFW
X-Gm-Gg: AZFdTZcAJS7Ful8PsXcfxv17uIV9M2ijJ8fRpykfs0/u6LHhmL9E3kSelTO04trjsJd
	Cehp5f/HHmDD4IcbvDcI2OrGXiaQZkLwKvIoJFOp8soQ0J/Fd839e2js++eO44K8fI3dynWJEJf
	7HyuOYTpZ/Q1+FWGI7iROt0PThCAGRt+61irlaL0Tk9SGdlQkIeIl2cPR+miSQ7hjsLFDWDzqHt
	qvqpo6GfpRxL3xC0nFyG91/rkz+t2JkNKlkoWEbf+Yq70dYBduB4AxybM/kiJOy4rhGLXvfI5Uc
	45I2PAfsgYPsNMXIpsHxVR42EnnKVWAQrrAg06LwWJ7HJZSHHZmLMXjiImtwYNG+ZLn8WLTyhCT
	UQeJ3apwPvsG48Q2+yX1V67Tgj7xKPQse5pOAb8q6WFLi/tKJoieeAsLbWtc7wW5ZK4LQEe9G0n
	8HkLkieP4HPZyITsMeQTM7HHiVkA6vcFiCpMS2q18ekyhIU3XHHJQzUqPP+WaeXVLNxIljSeZP4
	SQ/Pd80iWgqxBLJUu14qC7BERZJ2JPUj09olWE5D3rGUrpuuiEgm6pYCI7Ezyvjhq1ymrkqewcA
	VCGbakzEiBxcjt1mSzRSczwKM+Tl1rW6jJJYyhQju1DXNvKFWTHdZ+9zlnsJz3r867PXg6h5vyM
	hlB8YGOBUDpMEYAxf4wBtXSsc/cx47L+GAcGqYBB63be8
X-Received: by 2002:a05:7301:fd04:b0:36e:a265:8ee with SMTP id 5a478bee46e88-37966771bb5mr10661121eec.18.1794854047447;
        Mon, 16 Nov 2026 10:34:07 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm36636803eec.7.2026.11.16.10.34.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:34:07 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v2] staging: most: video: Document locks in struct most_video_dev
Date: Tue, 17 Nov 2026 00:03:55 +0530
Message-ID: <20261116183355.22563-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl reports that list_lock and lock in struct most_video_dev
are defined without a comment.

list_lock protects the pending_mbos list and the mute flag, which are
accessed both from file operations and from the rx completion callback
called by the MOST core. lock is assigned to vdev->lock and is used by
the V4L2 core to serialize ioctls.

Add short comments describing what each lock protects.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v2:
 - Add a commit message and Signed-off-by (Andy Shevchenko)
 - Use the "staging: most: video:" subject prefix
 - Make the comments shorter and accurate
 - Drop the outreachy list (Julia Lawall)

 drivers/staging/most/video/video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff6..8833ab5c7 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,7 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/* Protects @pending_mbos and @mute against the rx completion path */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +41,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Serializes V4L2 ioctls, used as the video_device lock */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.50.1 (Apple Git-155)

