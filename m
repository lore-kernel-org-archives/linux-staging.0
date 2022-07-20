Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD56015
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 16:24:35 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id bp15so34019638ejb.6
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A1ulf9tl9d6CNgfQ9aU3xsJISTrMA+hS9QZOTqZ3etU=;
        b=B1fpFgIPrLCBw3JbTobhegsCRwhKHLeS3mIn9zQfzDz/igoUAq0LQtKuF76sY7/xlB
         Os0oA4Z8ack8TjxSQfRD2lIPWg5/ZG2dvSLckQfu2xFSHWU/5WPWhWGE3nA/wyKHTsBm
         b2Wp5QP3G3uSHHP0Y0DR8oQA1Qx9g6nPcjIHY/OX71Zfzh7/OU+ribb8eBNV3Uq/sfxx
         hZUUwttFv8X8d/a9+Dhi8rwGWS3mLTF8/zhe1SYse5zngaPzAxl73pZlQ0pmIK4/gTmp
         uTeJjWSlnJRiuWoqNi5cFW8RqHCSa4PDvCt/O79BFhYNisZCQiUXKzm+pDSoKN0Gcysk
         k92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A1ulf9tl9d6CNgfQ9aU3xsJISTrMA+hS9QZOTqZ3etU=;
        b=goNynVhjZ0tCxiQa0uco75afYtAzaWIYD4NdkvBw9sVsZTXOf5lWi7YvDkmNQrnzXL
         JseuHph22sGeFt2gtKIegTt3vbn7tkyO9SASznUWZb9qDydeuS+Uo5z1zXh5/+UbW6oe
         5u1eUJ27k/J2tlA/xJ1i+V0J1dTOnHpZrc89XKFvLkoksAlYYJ3QNv5hYFpRzVm6LT7m
         wnklZssDMRonMi36b9xruWX+/htqfhs6SJBmHw5RdPkm8j1jKlIB/QUkE4mdgYL5wjOV
         +EdrSeKwMntmXk7XrS2c3rP3CHQ3uf8bceBsSxl+ogfZq28r7nJ/ySkiuaYZNGCA5/jg
         y8+Q==
X-Gm-Message-State: AJIora98zsbjBXmSMOXDaFBOkyBEsUCxdHcJr1+1DWyQtXfyUhOHYAis
	+mD+MNovd5PXOYoqiFMX9FIjqbTK/Q4=
X-Google-Smtp-Source: AGRyM1sVRsIQGOTj8rTfOADlm8LQIbTlAOZzvnsi5UY8hGwFR93ppZKRk/3ZI9/L//j5JzSWtgYX3A==
X-Received: by 2002:a17:906:cc13:b0:72b:31d5:a899 with SMTP id ml19-20020a170906cc1300b0072b31d5a899mr35255149ejb.184.1658334274296;
        Wed, 20 Jul 2022 09:24:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id u2-20020aa7db82000000b0043a253973aasm12347559edt.10.2022.07.20.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 09:24:33 -0700 (PDT)
Date: Wed, 20 Jul 2022 18:24:32 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: vt6655: Rename byOrgValue to reg_value in a
 macro
Message-ID: <83920d919acd7596488943182f37132e479d70f4.1658333350.git.philipp.g.hortmann@gmail.com>
References: <cover.1658333350.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658333350.git.philipp.g.hortmann@gmail.com>

Fix name of a variable in a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index e2ef8c6ef7b7..837ae9dd6929 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -539,10 +539,10 @@
 
 #define MACvClearStckDS(iobase)					\
 do {									\
-	unsigned char byOrgValue;					\
-	byOrgValue = ioread8(iobase + MAC_REG_STICKHW);			\
-	byOrgValue = byOrgValue & 0xFC;					\
-	iowrite8(byOrgValue, iobase + MAC_REG_STICKHW);			\
+	unsigned char reg_value;					\
+	reg_value = ioread8(iobase + MAC_REG_STICKHW);			\
+	reg_value = reg_value & 0xFC;					\
+	iowrite8(reg_value, iobase + MAC_REG_STICKHW);			\
 } while (0)
 
 #define MACvSelectPage0(iobase)				\
-- 
2.37.1

