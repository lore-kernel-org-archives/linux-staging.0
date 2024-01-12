Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5E35B5B2
	for <linux-staging@lists.linux.dev>; Fri, 12 Jan 2024 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDxskjJs"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5989e464910so1295691eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 20:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705035167; x=1705639967; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMzzmG1PU01z52zMYQ4mz/0VyGI2Cib5puWp6/ySFDQ=;
        b=LDxskjJskfi3uiqqpM5Pzf+3aX3Y4TMMZpWIMZvk4T1QvGsS5PWLotYVSVYqo4iNEN
         2f1lTfK6+kECzJ/aKNryvQfyJ20HLDJO9OAZUwTaxlpfIMIMXOZla37ccRns6ta6ghkP
         BtjdZ2JFS7Fh5FgZza9YKJapAMtW7vgqrqnFLY2ewDLwB6jM2/4YX+TKR4WvJWRayxk6
         G63hITQ/wkCOcC1jwCgVwjvpOuzmTgHbcS+MEKHaS6hWJcvytzT+qGUVsxBILrubx5wf
         4Ous3WdTAB2dN4u9WxMNmxrAOPpgYU8xNogZfYEYTwGWN4rM02CjzY87GzTbkjHZ02Jw
         gSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705035167; x=1705639967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMzzmG1PU01z52zMYQ4mz/0VyGI2Cib5puWp6/ySFDQ=;
        b=sMwW5Pmz3YOFsBLtcccN7S02C7PClYl/G/ZriFj/68ho+ikAy1O+BCp+ehCR9KVWUv
         TsBiUkmF4ASBzkVauw7bUs1VYCwgBrQJ2+j2uybaMgWmF50YkNHintYr+TJ2vJ/Y5E/A
         zalHVHLJ3ADOXKBXk6iEbozjaiBknHF3ircvpp59TrACkLOIjCPi8naww30rQZfHDeIW
         nu14X215gsMnRpkhlgmVBRVMHnvQ93Xkm5KTXuKMI5FSqHBpleQ/fkk3iOZS4g6SOpYa
         AXvTyupp5XzLwTdtMqBE1LQ7Drwo7xkcc3k+n3o7Un3XpVvTMDJCROh91P+/1+v2uNuy
         mx2w==
X-Gm-Message-State: AOJu0YxmUTTsGoN/PdNqPgxplACd9JQyW36YNPjyirVOkK8m98m1MUXV
	46NnrBXIscOjZguJUZj6Ymg=
X-Google-Smtp-Source: AGHT+IFJgzyRwboVdy9LT1n7++9wIf2SdbFJSaOXKeS6HdcURnC4aOSek9WjGWLY9zlN65VH6PnX9g==
X-Received: by 2002:a05:6358:6a44:b0:16e:271d:1db7 with SMTP id c4-20020a0563586a4400b0016e271d1db7mr965001rwh.2.1705035166719;
        Thu, 11 Jan 2024 20:52:46 -0800 (PST)
Received: from pop-os ([27.4.4.207])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006d9b38f2e75sm2183645pff.32.2024.01.11.20.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 20:52:46 -0800 (PST)
Date: Fri, 12 Jan 2024 10:22:43 +0530
From: Pranav Athreya <pranavsubbu@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pranav Athreya <pranavsubbu@gmail.com>
Subject: [PATCH v2] staging: vt6655: Remove extra blank lines between code
 blocks
Message-ID: <ZaDFm6XX7HiGWn58@pop-os>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

drivers/staging/vt6655/rxtx.h:22: CHECK: Please don't use multiple blank lines

Signed-off-by: Pranav Athreya <pranavsubbu@gmail.com>
---
v2: Fixed commit message to only mention files that are being changed.

 drivers/staging/vt6655/rxtx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.h
index a67757c9bb5c..be1e5180d57b 100644
--- a/drivers/staging/vt6655/rxtx.h
+++ b/drivers/staging/vt6655/rxtx.h
@@ -19,7 +19,6 @@
 #define DEFAULT_MSDU_LIFETIME_RES_64us	8000 /* 64us */
 #define DEFAULT_MGN_LIFETIME_RES_64us	125  /* 64us */
 
-
 /*---------------------  Export Definitions -------------------------*/
 
 /*---------------------  Export Variables  --------------------------*/
-- 
2.34.1

