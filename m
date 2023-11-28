Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA21E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/oAgABF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32f831087c6so1552935f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204210; x=1701809010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4jh3kAmz3NLMMvf/uU8x0FwkaNbHPqHSzrIk9a+VQ0=;
        b=N/oAgABFZPqMVl5jYTmyvafQnuuQKAItjQpxiiI6CIH6PKkQssGYl8iDS+1a050TMM
         Er3h52AoO/m6MFUU/dLqRGtYQlTEon+WTYIdcoO1rfvLJgjKjTztENHSf0VF+7dKVFFg
         uzRRJ0QKyHn8glUQNH/pQmi4qeQyN5o4TNwlp86lDLrvRZs8FldinW251c8Ssp+0N7PU
         ZBLTOlvnJ6FzDCh1XmqCWvFBjdZHSgLcU4G1HYJh0ft2lZLMin6YcDVh3IXNpxPi9rWp
         yP5cTCrwHkqXg6shYXFVa0rxRlhhv5xNoOuj9kotvsZdL8Qk0h9qJwh/zLQEpZII5dWx
         SA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204210; x=1701809010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4jh3kAmz3NLMMvf/uU8x0FwkaNbHPqHSzrIk9a+VQ0=;
        b=r3NpaR1M+q3X/uQx3exE6RXu1RPuFFRE0kJYl7TNP5F52nJVjjmKOxwZw4P8ECSnVu
         Fy9EngY30vbvVqcaXG9qcV+OHskCvQjQsbCcf/jPOGYYLh2d8BwDzQTo70ier/9CWoRJ
         bUEt7YX00rZBcD0zVJNxmNjl9MX1QLJItDCodG6pAUz1Hm8ARVdNHOHS6bv44NE2uscu
         6OVftrkQbACMEomxG9NN7jKy9VdWqgCGYBwDJsNhesOk6qhG9+niweTamLSjtBwS81Tr
         6vGTPr4tuY8vhdkYPFQkGzPmqqZh3/lwsa7MzrzIJV5VV14xvBI+ZpZg6+8D4TPEY/E8
         v5wg==
X-Gm-Message-State: AOJu0YweFHzotJeLB6CxXOZ5Y+RbzPYITL9+6Kjcw79FgUEx+XfVpcAt
	b38vFghLKkyUb87MfFzSOZX1TvFPIcY=
X-Google-Smtp-Source: AGHT+IGlSPwq0XYOKQo2Gcbn4coEuBaz6tt2245HjfIV9x9M6ftvcJ75ndEXflqL8/VwW1akk2Xp/g==
X-Received: by 2002:a5d:6c6b:0:b0:32d:e435:92c4 with SMTP id r11-20020a5d6c6b000000b0032de43592c4mr14272134wrz.0.1701204209925;
        Tue, 28 Nov 2023 12:43:29 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id s11-20020adfeccb000000b003316b38c625sm15994336wro.99.2023.11.28.12.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:29 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:28 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8192e: Remove unused function
 rtllib_send_ADDBARsp()
Message-ID: <3d0b46b4cd2538a797743978c4c2daeec32f1f09.1701202700.git.philipp.g.hortmann@gmail.com>
References: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701202700.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_send_ADDBARsp().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 7e4aeb10a2db..fab7ced1b8c3 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -186,18 +186,6 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
 }
 
-static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *ba, u16 status_code)
-{
-	struct sk_buff *skb;
-
-	skb = rtllib_ADDBA(ieee, dst, ba, status_code, ACT_ADDBARSP);
-	if (skb)
-		softmac_mgmt_xmit(skb, ieee);
-	else
-		netdev_dbg(ieee->dev, "Failed to generate ADDBARsp packet.\n");
-}
-
 static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 			      struct ba_record *ba, enum tr_select TxRxSelect,
 			      u16 reason_code)
-- 
2.42.0

