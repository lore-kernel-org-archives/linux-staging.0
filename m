Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD22315D5D
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932674; cv=none; b=uePEUcR8oov8LMH473sG1olPQWTuM54QelrTEwUmw74qBmB1Any2P8+JTXtXmramyw2VkXcPYtzXdqV+tmc4xqfp43vlxJsMLnuL7UUyoiOiailz/QAnVXrMI6XkY3jycQqn919vl7DBnb6hVc0abHj+tWW0i8TgGqBrIrmHDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932674; c=relaxed/simple;
	bh=Vnwupgsqqua90+twkjySStW6ffZlrwSOpXf3UgPtv7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DARJG9+99W1cElLkME5ODsCxRDpO8Kww+5ZYc6QKm/V5sE0WXTNmwVz+1Z0XUTG5C7208az2v3QG2zhk1daoTk7jfSTBA4Hyn4Ta3aAeocJn60iBPfQF1YZip1ochICBLi/cmhTlEUrbrq4MwXFD3Wfn8QicAap1pDvYcQJw2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWvn0gTb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWvn0gTb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso39423095e9.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932671; x=1791537471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=iWvn0gTbWBADiVLm9rz5PUH6FGtUXtA43wg9YtHzz9CgmfIFkGH79oEkx7Nh4MiEGl
         TeoW+EOyW+iLru8fLkeIcoXF4Fo325b99nfMxjUyd448fyenA091LetT5xIvSdMKAblF
         g+FmKuhKwdSLDZR4uwBCLtU1bDGsVZQbFxXYrIBEg7mBnJrKmTOdNhPWDt58GSvmKW3l
         95fZwvcCe1h7nZaHE3p+Wslmol87jGNYAs3i5URmSnhhMa5zhyhtGl0Y1DDdtYPV96ge
         R9qywgdyx5k6EmeMEZTEZRwedN8FBR4UN1NDfez5Ui2Hb8WPbynRTew6DWvHQ/JalLMA
         CU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932671; x=1791537471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=S3GLixRVx3hlMATAi6Q3M6grPS+T7iRbgKITZBL08NyraH7GFOCx68UwPKyi3EjHLK
         6mfI3nn6DjEqTUTwj5eioNChFZra3BcnyF6U7Z+WrWIarOA87wQs/YB371CkOuKG/p0m
         hBBQFcgrvt0ulV6UnPktDz9Fi7NiGO09BDsspIvtG4wLV2hOcc5nAT5lmxI7N2AvttjW
         PEmIsYyUYd3/vauKDZH2jp0cGLw3CZkiOXiNJuQM8iYjuXma0ub/8+gcEMTvORt3lder
         jliVpcMBbhXPx1syqxpmSXuLBA+8CL2e26D2W8MqEVVTrUj8PbZXjcyRNeWb6HQXCBgf
         N7zg==
X-Forwarded-Encrypted: i=1; AKwUvBxWsQV3mL82IC+YNj4AbTOJDk8oezGX0oPDBd3kT1Oi3tIR9fFWcXR8sTaJNkOeGzKC+5+RKvKfFbejcimN@lists.linux.dev
X-Gm-Message-State: AFuF++l/5L5P3uUSXgA4Va1kw5GVk8fiwH9XnY3A0twZZRo8R2D+odwO
	aX2ixi9L2IoppbIkpFJBRxWrcNi5Na0vsBwR7QW39clr6oork4+h+xZM
X-Gm-Gg: AYBFou0aICtdvux7ZS6hWC4tWgOrac5nH/m+rvue3nIZetlFp/qg/Mu9qKWrgX/qNpr
	+HFY52PzvdCQFk79ctCKnPKgoQ+d2hS1+r8W+i3x+n4BI4lsN/YvHz9Mh4x2fxrBBv5PbRmhBeb
	oBx+hKXKBQ2up4ZR0DhVymJZeK8H+AT4ABN83FswRXKMLFklFktHdF3tGkrUYEOxszYDzt299IM
	ohr+D3BZhOpwcxdSP3R3TgZj67/nwwiZsUsiytZ46RSvyCjC9Cw4SWNMn/n61F/zahpagYJGvco
	824EPORWurYCb8hbs9OmYUnCf0X1Ft2KVMIGxUAHuhkfgtBmffGMqH+zrc32bq+pzMrUQSD/tsj
	3S2DlWiEzQlBlZSnTuULBMV2kL2VYfk33qDT3gLb9sJzooWr4ltQi61iiIU5KV0ZghZ5RHURLdZ
	Y1t9xkbUdPgAwVplMvjFVmCrNIkxYrY6VIlfrJ9QE+1NIOZz2sGA0/J9OR24Xf3J9+5sgGDeipE
	2rpRrQ4ffFzg6fSeCNQPt54n8Km6AIGKsAHGewB4XhLHyLcWpAgYFJTQhY=
X-Received: by 2002:a05:600c:4e56:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a027584b22mr41936255e9.21.1790932671197;
        Fri, 02 Oct 2026 02:17:51 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm45498425e9.4.2026.10.02.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:17:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:48 +0200
Message-ID: <20261002-media-v7-p02-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar674__4-cNOGMMy@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I addressed these points in v10 patch 2.

The commit message now describes the implementation only; the runtime test
results are in the cover letter. I removed the invalid Link trailer. The
clock constants now consistently use integer unit macros:

  360 * HZ_PER_MHZ
  24000 * HZ_PER_KHZ
  19200 * HZ_PER_KHZ

I also removed the Cherry Trail/MRD naming from the sensor driver. The
19.2 MHz table is now named for its clock, link frequency, revision and lane
count: ov8858_19_2mhz_360mhz_r2a_4lane.

For white balance, the V4L2 UAPI defines RED_BALANCE and BLUE_BALANCE but no
standard GREEN_BALANCE control. The driver therefore keeps green at unity
and exposes red and blue relative to it, rather than adding a private UAPI
control without standard semantics.

With Best Regards,
Maurizio Casciano
