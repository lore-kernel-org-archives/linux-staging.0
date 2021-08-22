Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B353FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 14:35:44 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id h9so26382439ljq.8
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eP/fzaCJf83R5w9CDsCe7nt2TiaRQKPHnE9dwKIQjLo=;
        b=gqb6BIVO+Td/48zr8iVCss+idcNfZQjpHS4sUQk28yZPnfprPYY9OhyoXENORpwvcU
         HT8xD81CfQCdRZGlUDu0BOcOo9fCZCu7t0p2cfuh8V/AdwbMJCVhqf4M3eZM2NkQfAMy
         HmaPuTyy7p5Y44zTgRQ0zg/oasr+YS/UnC77SZeB5jp35u5nKTcqX4G7nfNkww2WOFOf
         8X6+kipIxJicPizjWnKEU2rSmTDYETAyV0LcWnB2IFqz62de5EmhqTebyKmDsTDCXMHN
         0RX7v6EwMEuBKQka8cFpKAlBSdiVjdD10AQ3kBJb3tUhXUbA7eOF/FwqiuiUJ5Wr2UJZ
         rVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eP/fzaCJf83R5w9CDsCe7nt2TiaRQKPHnE9dwKIQjLo=;
        b=iZAfgIj5/hqdrAN0s4p1fEL+04RbP4bdKskJvo0OWHCQQv9+5rKmD0xF+0SchCP7ry
         xXEXA8uwDAk5Kpo78iHiQJ49FuAhzgG8I2mujACTGUPGSuOsX9JElHpmzHLJ29SF++WJ
         tu38bc3yOsI0YhvQTbFARqEh9mMZ7HFpdN0PA5Ladk9XsKbD4YeYbwq9Aqt/RHj2RkA6
         SqbgAEe3A1gZ9I8SCjvGNSsQTnPuLCF8uazsK0neC2JRTIratV19ISvDtbaCsKcZAF3O
         E7uKo5FE9gNPM8CaroquVUVob67ODUO8OVD+pho8RsctfbY5htgF3uDJ9P3OSYLghPcs
         cdfQ==
X-Gm-Message-State: AOAM531ZBcwylz/jL8mELqcbWxSXhdDsj8w/CpwQLpQpjEOWEVD4AuwG
	lRGGLFPr3uzfCcL7RKTjceo=
X-Google-Smtp-Source: ABdhPJyfp4MxhDarGVbzJswfS9l5IidvhlkpJb8VDlZlSigNCiyKALeaMfT9wjbVYlH2T5nvh4nujA==
X-Received: by 2002:a05:651c:509:: with SMTP id o9mr22787653ljp.449.1629642942919;
        Sun, 22 Aug 2021 07:35:42 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id y4sm1207899lfl.38.2021.08.22.07.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 07:35:42 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH RFC v2 2/6] staging: r8188eu: add helper macro for printing registers
Date: Sun, 22 Aug 2021 17:35:41 +0300
Message-Id: <84e388b0eaaf3c56f575216b0571318ed799a4d2.1629642658.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629642658.git.paskripkin@gmail.com>
References: <cover.1629642658.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a lof of places, where DBG_88E() is used to print register
value. Since following patches change _rtw_read*() family
prototypes, we can wrap printing registers into useful macro to avoid
open-coding error checking like this:

	u32 tmp;
	if (!rtw_read(&tmp))
		DBG("reg = %d\n", tmp);

So, added DBG_88E_REG{8,16,32} macros for printing register values.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 3c3bf2a4f30e..059647b9cd3a 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -72,6 +72,19 @@ extern u32 GlobalDebugLevel;
 			pr_info(DRIVER_PREFIX __VA_ARGS__);			\
 	} while (0)
 
+#define __DBG_88E_REG(fmt, adap, reg, size)				\
+	do {								\
+		u##size __tmp__;					\
+		if (rtw_read##size((adap), (reg), &__tmp__))		\
+			break;						\
+		if (_drv_err_ <= GlobalDebugLevel)			\
+			pr_info(DRIVER_PREFIX fmt, __tmp__);		\
+	} while (0)
+
+#define DBG_88E_REG8(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 8)
+#define DBG_88E_REG16(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 16)
+#define DBG_88E_REG32(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 32)
+
 int proc_get_drv_version(char *page, char **start,
 			 off_t offset, int count,
 			 int *eof, void *data);
-- 
2.32.0

