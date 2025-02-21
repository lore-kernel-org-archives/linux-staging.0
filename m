Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103F20A5D1
	for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155705; cv=none; b=f+GH6yQJ9qFGT0cWU3bin/D9Kez2c6GRDI0B80v6AL8xTeOve3yUxJ9sB3T36Dp1Av8iCbH/o/g2jq+pZPpPidJPp9RRzRJkkGkn+qGd8A+GA1VwGzYydKeb7I/IIaJw7N1OMk8UL8xKM4YMZbe+5yZFaYVnuOHoSR4IcLe/mHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155705; c=relaxed/simple;
	bh=fpeqhpGWkHurwYKTB1xKAEQUJ9Ttk3Bi42IWr/pT15I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lrhm86IKj9df9L7i7w+UAhfsbPUmIuZB85MqnvCxNmdzMMy3tAbjkvSUJG7I6HklhPPNhL0MtpBg/81sYA63j365Wj25rAJ/rOGkplZg0tsW+xBZQm1lh2xCl7unA2WauvZiV0b+jaQ86MFBcxZqFlkH2LiW70pzMihSZyiFwFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEQz6+ja; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEQz6+ja"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-221050f3f00so52244205ad.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740155703; x=1740760503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AsR67bqF+fqYAZ1L+J2XlKEArNOWP27kWrQCUz/8HA=;
        b=cEQz6+ja1c6UAYqjAx2cLJRAYqbXjTXShESg25TvdfeM3LPvjhDk2osCNrjB+0xQbU
         c5SnCwyTC8vu+vIJco7iRKiLJrglygKIKMiSXPeFuRYYkPqzSMwOKyV5yWt65Im9TKdM
         QkN2KdnK4xO3SJMGS35SV2Tj0DYk/xnr0UIi0Wx+r018Po6Km97WsC1WjQFEA8533+bV
         YsOsHj/oNnleBm/WzMjnk8pZzRwnnubNG1V6aMXEWkgQh3z/GPesrfQKkGWzp3veiKnE
         JFxSZltY/oacOHukwbJZEC9tjjsrRmJz+pK3DYakiEhmTAM7AbzTbu+pW0m+2MsRzDxp
         Bs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155703; x=1740760503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AsR67bqF+fqYAZ1L+J2XlKEArNOWP27kWrQCUz/8HA=;
        b=fv1xKpJ6BuBp2QnXc/pz5rEA+GYCQ8ZxSh+Wip6e9r+1YYZk+KdtOh9Ym4jP/QEOXr
         HvIFNHb+8ajqKewVEB6e1pcgjAa6JejB0rUpO//TQOgHmTQLK3GsWCaehY1efbbw2N0y
         vOI8xqWX8yO9O2rmrNAT+o0ROxuvlrBpCSigTn3i5Tx9iIIWwngVKY8nBjuRY4rT71Iy
         2xiCtGDd5IrTxkPtGx/JE+hZzywo8CTZX2YztmOMzt861iosu1BmxIy9UY309vmztdVF
         HE+wSX23I/NbgO9o2K5kim8dyCO1nLhaSxYMrkw2Xlpa532JIKzpErpHznW6PBL2gjll
         LRFw==
X-Gm-Message-State: AOJu0Yzt9BnGQnI7aQ97lz724f6XfL15yus92WUT/zMU5yd+/HD5Zi9J
	0XdmpRgrBy9cQ5p/fLvhYR9EuYAByHGr6peHKnpAje5neBbF6rlL
X-Gm-Gg: ASbGncvgONAqCsBV+xAPlOnOlKmDO9Okg66NGHrGudRCRHJ8OSsULDt/SkhvKfdAux+
	kB7iihW5WGm/i2LvAbMORaHRyrfTjxed1l1OzDeRn49cRfmQ4N2a9AqjIHDAWACdAni2FiBD1Ja
	GAVLAJD7aBBYrlAbpjxqY7qrqBiLxbPzSwf1Z0E5whJ6cwlX1ZA/BhV4i9LjmU2sPNUvdPCgARV
	qw3TNGcLc401jI6SF2DsPZkACYe9tsxbWY8WQfNddDbm0Ps9y+yUPIPKRav7KnzSPj/VNSAqq10
	xA0osby6FDOkTM1d9qxEqKD6ydlw4bmtuRSn
X-Google-Smtp-Source: AGHT+IGctPnJHG4Of691gOP5YNdzGWLI1p5+EWLvVFReLXo7Ywxv+0S0bElzEnW04iePSBpgf4qHFg==
X-Received: by 2002:a17:902:c950:b0:220:e1e6:4457 with SMTP id d9443c01a7336-2219ff5e979mr56553245ad.26.1740155703134;
        Fri, 21 Feb 2025 08:35:03 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7326a52f865sm11737379b3a.80.2025.02.21.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:35:02 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: most: Remove unused spinlock from most_video_dev
Date: Fri, 21 Feb 2025 22:04:26 +0530
Message-ID: <20250221163444.57492-3-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221163444.57492-1-kumarkairiravi@gmail.com>
References: <20250221163444.57492-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

The `list_lock` spinlock in struct most_video_dev is never used
anywhere in the codebase. Since it serves no purpose, remove it
to clean up the structure.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/most/video/video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index bd51125698..83b46476ca 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,7 +33,6 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
-	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
 	atomic_t access_ref;
-- 
2.48.1

