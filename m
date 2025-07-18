Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481BD218AC4
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872931; cv=none; b=ejhKjaQPQ3wKUBUEiIFx6fvnPjuiNk7oBVEoiM0hLLUxggCX40bMnDuy+SJhPwtRIzQfEWHTpAhQ/cW7iIwPxQu7JbcmHugAEQ0LtwlIvM9eG3zpqAu3quNJG2i+SA5iuYXU2PnlBcWUS3ML/rsigiWPn62ft6BHegaf+FgHKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872931; c=relaxed/simple;
	bh=Nu5mtZ4NwfZ8rujMonQHI4GrQ8sbEhrMWC62SCFw1Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIopQnE6GFd6fBqKycGNg39DJMBZQxqmVCfai8kJl1xLY+qaSE5PLhJQrO1Vv8ib/4DaoghCut4fkhUO20eC831xIQIrOS5AL6Ncfwox2wjCYeRp3bZBwTioeiOvSDvH+KsFWm8VDajlbyxgCbjjjwCqV3Z4M6nnIax5xb7xLr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2ymwGDL; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2ymwGDL"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-615917848ccso1043923eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752872929; x=1753477729; darn=lists.linux.dev;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pSULKMzrr8h3J6cHGwQRnm1S6z9BixXJHjAlFAzTitk=;
        b=a2ymwGDLVITG1deWkdouUzElOs6KmDEunPnCxxGC8J0X5acHknQg1gC/pAHz/lES5b
         cfxXuo9Oa0SPKNqMSP2m5y2YGdhdwYfKcp2Uvl6hjX/VyQFsMm0SvQtCFzDOz7wDkR9r
         qwMaPHJfDhEqmN90CKMrG5cpJ2EE85Z4vxLBrmKbHkt2isY+1Nn8WzL6fQC9FB6JsmcT
         oHOkJeWOEwJDe3MCPQHjmxJ4fP3s6MbvYB/Yi1P9iGz9P07auq+oV2hda5txdrwGt7LS
         NODe8XG/nqkNuiFtvc5kz5fiP3j8stceSZ9BWeMOjaEmda0Gya76nJSVYbZ0e23w7DSa
         89MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752872929; x=1753477729;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSULKMzrr8h3J6cHGwQRnm1S6z9BixXJHjAlFAzTitk=;
        b=HhQWD1FVDPIRdtCzRnA+NqrAza23kwuQcTay1/6wK3phbgc+b96Zy1rpvxAmRAPKvJ
         bxPaL6FdKLNXsaueLxvoz7W36uO/zZFfXDpiOLhKzd148whPtBk8sUmTnNrUHwbiQgys
         fVpbQ5sBoVdqBQPofgT6WaswpV22YNpcva8Pa+DkbB+hFibh7Qr+jcRSCbEbAK6+wJ67
         TszJp3sIII1OljgD1bO/UJqxlvt3pbd9ihjN3FOsPoryW02B87oZd1LQlPRUb0bafxl+
         bbuh627yM6nqH/WBlfAJKAUst0pZ1/lm1GJLO2BbxeOWUDNuj0Wq78LXwnKlEDDsLShc
         nClQ==
X-Gm-Message-State: AOJu0Yxh0XCUh35odrVqXw3zzmI+k24PhQCSGAYSmHh3WWycyzdR6i5N
	mk89a5CvJ88UCuHwUWXNybvGdZrg6wxT9Bc3Yd9bYhc4b+NT5yFfAwlm
X-Gm-Gg: ASbGncv8b1n1RULNWe2mtcs5liHO7p7K8Uc7AmZ/oHnL2PZ364a/wuZROgXm5wxAFCh
	hWTVNR7+Z2AcDVqLO0kybGTplmK3rlhH+gANgFDHRWk13gt5wx9OPX7F5EEfc7NmDFiRzw0p7Ch
	eqO+74bMokovHJopMHdUuQ7nqGm9Jn4VBdfn3sp4fN6K8CRssQ9zY1qrzMM1NQYIPDfsIL0XWea
	kIK7UENvWUkprCQkSjo8q74l5V8VDNOzuT3f6KpUUv8d3hFDd/jMYdh8vl20Nrt3vZouDWWQa/4
	hBYYAbCjW7/RDquwVokhERxyQ85VMlCejScBMVS/KdUDDxCqFk882qZS3bGCJX8ak7S7WFWfblT
	m209BDU5ObdCWbbekHNI7ZmVpCoJJUX3JKmKJxbN+v0rb68QKb2mxEjuUrdnDOw==
X-Google-Smtp-Source: AGHT+IHx0kDpjfV8SxDOWW+9C9/fEq/WS+qbThQ/XaDA0IiNPkWI3p28qTBXAzs9RbnlCTE0ZgP4Tg==
X-Received: by 2002:a05:6820:201a:b0:615:c2af:de7 with SMTP id 006d021491bc7-615c2af11b9mr2147349eaf.4.1752872929294;
        Fri, 18 Jul 2025 14:08:49 -0700 (PDT)
Received: from MacBook-Pro-de-Ignacio.local ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8369a85dsm935936a34.27.2025.07.18.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:08:48 -0700 (PDT)
Date: Fri, 18 Jul 2025 17:08:46 -0400
From: Ignacio =?utf-8?B?UGXDsWE=?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4] staging: sm750fb: make fixId array static const char *
 const
Message-ID: <aHq33vXh0F481FB-@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.x.x (Linux)

Fix checkpatch warning for the fixId array only:
"WARNING: static const char * array should probably be
 static const char * const"

The g_fbmode array cannot be made const as it is modified at runtime
in lynxfb_setup() and lynx_alloc().

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
v4: Sorry for the confusion. Previous versions had wrong line numbers
    or included changes to g_fbmode. This version ONLY changes fixId
    at the correct line number (734) against current mainline.

v3: Apologies for the confusion. v2 accidentally included changes to 
    g_fbmode which breaks the build. This version ONLY changes fixId
    which is never modified.

 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..82e01f114 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -734,7 +734,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.39.5
