Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46C3594E;
	Wed, 16 Apr 2025 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807756; cv=none; b=e8kb03aPmCPpgdLoBldOFNvqRRqaNd2PbD+TZOAs7AnhJXzAd/eZLnxECrnVmIS9/i37CTszt3EYn5P1TVFr7i3m45UtsborcQdW21FVhz82z6ASec7WHz/PzAWluUk/A5ZXlVkXyJIQo1rOpjwQZpwj8UN/WXLlDgefKBv42kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807756; c=relaxed/simple;
	bh=Oie0CA567N2TU0fwBupMchn1K0iHfp5AaY2vGOjyCIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMgOaPRlMoGsDzcGtZ52EUml0pDtNeZhBSTLjD4JBzq1lhfhFFbJLbkwGUhjGF/AFdGzD4me4IxL5zFOphswvwW9DPWEzeAvyRcr3OEAdQ5AFw9kxl9AxUWwbNV455YUVkAi5wUql1EcainfQOGO74gDCngVuzLkk5ZwLzHlDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+5vKUzI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+5vKUzI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c1138ae5so6579522b3a.3;
        Wed, 16 Apr 2025 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744807754; x=1745412554; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldt9IrsiOSqhio1MCd7bKSNWymFtZHgXwO+I+eYx310=;
        b=J+5vKUzIta8aIe36cbr8+tU9rMdvvwFm4n5gHMhPC88vRzyEv2RcgkXYl5vy+joBW9
         OeMqYgPf5/EKCbOvMqK/C5/VJUalbQ28abBN24k56e7dv18N3msLK2AXCoEn7qfFZyFL
         JIA0hg3n/8b6VCh2PVVLHznS3itM1PKq9qcqMOr4T0LJZ9qMLuJfZOv18Q8OC8mnOXft
         kNTJ7Eqxp7HLV8nqAWhzqP1YgRR07o+2XYmLBmFRgvHCAiPc/loxVEKofwv7VuLsA2Os
         mMXFJoKYq3FZE5rubXfSTKB7Q4quuFe3VejOc+ewKJccWXwSzgMvAZFALRXBpK6g5UgZ
         KeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744807754; x=1745412554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldt9IrsiOSqhio1MCd7bKSNWymFtZHgXwO+I+eYx310=;
        b=U82MLXReoZk2hTqkWcXHFHMPNPs/zUl/LhHEMBus+2vSCZ+TCdivi1IL+uZrbbCEuo
         5+TjcBW2dSc/xVtQiUdaYhL8RZh6yLVbG6nMXfzjZ6Ygf8729BDw2PPMCESBCb3uTs+m
         gGSB2bVko2rT+vpxcfpGIqnxx7Jf3qGhyZ+rN7SKyb180vfCQKe+ooIAOkmwGDr6LKGN
         rrT/2aiJpf2d/EhpuwVfvQwL/WSZRoMChDxL5mI1nV0x6drAsCpRtsDA66hiKhL6Qzqj
         HabbhXQvARFIAtB7wwuTGRZt2nyMwJa89u1Ptc2KVp8k8BxiqmnFm04wuvCv+dKW4Hp4
         Ht6w==
X-Forwarded-Encrypted: i=1; AJvYcCWcBlj3ZHTZQ+ZV7APb3/4dwu86A7bZtQe41n4oXJ4WW/7azs1sa7TL+NpUBaskp+dGTURkYox1SUbki2Po@lists.linux.dev, AJvYcCXCsDfJZrN6FzAEoHXLhM2hWzf/Z2OGmKMYagcB7Xi0lbIagTYvUYzOzl29P7feOHqmdMCzL66l9yU1@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4rUbWz/HhfaVtx9F42Dk6xy9bKZiOhEjehsWwYhja/o6CdYLB
	HqA8+MnE+Bqn3YJrzfQ/+pq90XdRu8cAH9XqumzLdz+ZodZsLw1i
X-Gm-Gg: ASbGncsg2g58AxoV3nbqPaSDsgLeQUVBmmXV5t/D+pO/UuZnj231WOK2K+tdJVv2YV5
	wP/rYknZeVTOuW/eFDGEsL1+CVh+IPXeSdFoJbsDyDgXVwj2ZTyHw6FC6QY02JZnK1riDexBcIe
	XV4HZvGAk7eWSczB+8BYzhR7o8BY0+tPzJP0QL3aBml+saxpwsppuHBgoLuleO4beMSyHPSztAH
	ypSWwyZOI99Wgwoh+ZmTzVMOF3BG9KsuhONsIRB/XD+3Bfw0hPm9pN1HckaEhAqhrqQP2GLtQur
	uFUqxulA8lJxSFJVHxm0Yum7Hp/K6uEpJUKtwRQMONg7poqPUw==
X-Google-Smtp-Source: AGHT+IG/CPfVYEph2M7p99ubwZU+kSDnukahDwg624Hd0IVR4aChNY4Tva8+Qvi4aQGmrLXTd0OYrg==
X-Received: by 2002:a05:6a00:2384:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73c267f55e2mr2454611b3a.21.1744807754007;
        Wed, 16 Apr 2025 05:49:14 -0700 (PDT)
Received: from brak3rDesk ([115.96.217.61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220aa4b2sm1161674a12.5.2025.04.16.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:49:13 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:19:11 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: braker.noob.kernel@gmail.com
Subject: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c :
 fixes checks on the file
Message-ID: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It has recommended to
Prefer kzalloc(sizeof(*board->private_data)...)
over kzalloc(sizeof(struct agilent_82350b_priv)...)

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..956e21886eb6 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
 
 static int agilent_82350b_allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	return 0;
-- 
2.43.0

