Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082211CB2
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vqr4d53S"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5451faa3aa7so923362a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432167; x=1701036967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9HmufOMefniw7+AgeLkrs+Ikau0t9ZA3t0+CpI9Zt9o=;
        b=Vqr4d53SPUgVE10NnEC6cgzsW54ufHKfn9dqj0F4Of4IESYVbI0gKmKEeF3MHhuzA3
         D2Bh+WlZ9wB1kGI6RsLBG6QHdIIhL3TEw8EIPZycuX1bQLShwsAq+1dvCr2KuimLyBG9
         BHMDjWjtzEWCupMnvoB4j+6Ke5Jf/5T4iZ47OAI0UiNWwVgaSUVV9cxTEkfFpyDX+LJL
         P8Uc5jermBcdcyFqz7SaiSpEHcTc+jHvmuEHIR8Z9wi5pqJAEg6Yoa8tx/J3hLqq3uZR
         RnVjk5hOjokmRZ5kR1omgIBelbWCe4Uoxdqs9b0y00c4l0CFvMiYgvTuiKoCgdVujUDn
         979A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432167; x=1701036967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HmufOMefniw7+AgeLkrs+Ikau0t9ZA3t0+CpI9Zt9o=;
        b=Rxgf6Wu2Lp+dcFJ9ZwaSY2WJQpeEnAA/Z5stehk3Mp5qSU1NXvyNrB7iZZLoCEcPcj
         idNoLRrGfuDPwLXx8donmHJ7N71scpq2l55pCMsX22kyh/M99SkK+HnmHtbghUKLyILX
         s/yo2zjxYuPNW+3doihot4mdotr5sXeYDaXFS9xQXA/eRnHIDbyrJ40clnE1zY5WiX0g
         JhXsHtWHavvUJlvzLOqPR8OLrho864odjgHf9jGYXSfAbDXyRiLMCNr8pdbvMgeByRNh
         Xz8xPx62Q3n6uwD1iMmzE0HNdoNt3sd5tCRMuihaoXyQU+jdCW0a0cHk3c3Ak8ihWAYb
         DGGQ==
X-Gm-Message-State: AOJu0Yz/gbruBjrwAbFt71KfEc5xCpxPZuN3ojDYLY7Slo3j4HmkeJA8
	8ZAhCf+ckKYWhKsdUqhlGRk=
X-Google-Smtp-Source: AGHT+IHjAlXs0jAQBfqT+IGd9CwZfA7CKwOfC9O51NUT5aj1JIAg3IYCZ/EbBCQNSn75DkyUE9zJMw==
X-Received: by 2002:a17:906:5191:b0:9e6:69d:46aa with SMTP id y17-20020a170906519100b009e6069d46aamr4332511ejk.6.1700432167102;
        Sun, 19 Nov 2023 14:16:07 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b0099ce188be7fsm3215485ejf.3.2023.11.19.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:16:06 -0800 (PST)
Date: Sun, 19 Nov 2023 23:16:05 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] staging: rtl8192e: Remove unused variable
 bss_start_channel
Message-ID: <a13a8421d43ef1baa2077af1d4955059eba52d79.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused variable bss_start_channel.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 1 -
 drivers/staging/rtl8192e/rtllib.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 9ec112e00e38..d51d4afff61e 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -25,6 +25,5 @@ void dot11d_channel_map(struct rtllib_device *ieee)
 
 	for (i = 12; i <= 13; i++)
 		GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
-	ieee->bss_start_channel = 10;
 }
 EXPORT_SYMBOL(dot11d_channel_map);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 820951602fb0..77ae259eab35 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1324,8 +1324,6 @@ struct rtllib_device {
 	void *dot11d_info;
 	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
 
-	u8   bss_start_channel;
-
 	int rate;       /* current rate */
 	int basic_rate;
 
-- 
2.42.0

