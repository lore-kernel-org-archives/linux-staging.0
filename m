Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BDB6D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:27 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r12so32835214ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neVPOglzQUO+/apA8h71mx7XbCHUA+cecpWGqwq81h0=;
        b=r/pszrePahX/ZIEw/qPCROxcL67jj2Jw7yxq3p1QccmFamerTMq4UgpXgwvPCWexv1
         IoW3+dI2kL3+E+awmsF2NfPcIEfRnV6g0dfRQY/QMop26+/DJ/skzVL8x8uHsmlrL/h7
         aN4XfOvXaLiqUKv9yH7SUIsCRP2ALulQGfTg2q6Ve+lKjto++zhFvMmKw/y3I3z5KF3z
         nZnzvmC2WMAVsU4n67D7VAM718T/bCl/g+1fJ6l8pAt2piM/oligHQ1m950ATZFpthwD
         LVRIxFAJC6kTT8uLjSd5SCUgUM2F1hzHEUPRtpqkoX+TdPeO75Gh0JgdaujXeBIy7mY7
         OYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neVPOglzQUO+/apA8h71mx7XbCHUA+cecpWGqwq81h0=;
        b=gV8A0LoLgj5CE4JFYrZR9c7Nm5MeARlfMlgK+Y7Y6DD2EV6pY2ynspbOnhin7URCg0
         oAbY4bCsf0iwltzlymg3mjGzfJbwC7/a6K99Y+AJMKK2M8jvavPZm4Q0MhVwSBSjKqSj
         bWh/GLY5rx+I6bYSd4omUVbYSmDEaAqjJ4GlcSIwHO3j5oRWw9oXPvQ747wZZYF8DWwC
         aREco5LAFbl9HSTqJfHAJcTo5SECQ1xomnAJdSxaRPKa6gNnYlO3mfdNfvACE3Zif0FA
         uVgQePWwp/J6nlo5xQEVN/N1Qj9JLAxVSSBlocmQbwJ01udIa9WgzQjQWrfMA1mv5iHd
         sFxA==
X-Gm-Message-State: AOAM533ZlcBOKBhcJ0ujeujTAQGliXBHmHJIQc+Wj39XBxEM2l778KZW
	dldnBDTP/5zMfpnb56CiQkqHJw==
X-Google-Smtp-Source: ABdhPJyHNW9DGM/DSJasteQxN/CjRvI3zbzl8CAxHz1wzLPKutcwdMpurcUc4MKqBRTwAV1NJz154A==
X-Received: by 2002:a17:906:d555:: with SMTP id cr21mr191527ejc.66.1618423946041;
        Wed, 14 Apr 2021 11:12:26 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:25 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mori Hess <fmhess@users.sourceforge.net>,
	"J.P. Mellor" <jpmellor@rose-hulman.edu>,
	Herman.Bruyninckx@mech.kuleuven.ac.be,
	Wim.Meeussen@mech.kuleuven.ac.be,
	Klaas.Gadeyne@mech.kuleuven.ac.be,
	Comedi <comedi@comedi.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 49/57] staging: comedi: drivers: ni_tio: Fix slightly broken kernel-doc and demote others
Date: Wed, 14 Apr 2021 19:11:21 +0100
Message-Id: <20210414181129.1628598-50-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: Function parameter or member 'counter_dev' not described in 'ni_tio_get_routing'
 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: Function parameter or member 'dest' not described in 'ni_tio_get_routing'
 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: expecting prototype for Retrieves the register value of the current source of the output selector for(). Prototype was for ni_tio_get_routing() instead
 drivers/staging/comedi/drivers/ni_tio.c:1544: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/staging/comedi/drivers/ni_tio.c:1584: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mori Hess <fmhess@users.sourceforge.net>
Cc: "J.P. Mellor" <jpmellor@rose-hulman.edu>
Cc: Herman.Bruyninckx@mech.kuleuven.ac.be
Cc: Wim.Meeussen@mech.kuleuven.ac.be
Cc: Klaas.Gadeyne@mech.kuleuven.ac.be
Cc: Comedi <comedi@comedi.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/comedi/drivers/ni_tio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_tio.c b/drivers/staging/comedi/drivers/ni_tio.c
index f6154addaa956..da6826d77e600 100644
--- a/drivers/staging/comedi/drivers/ni_tio.c
+++ b/drivers/staging/comedi/drivers/ni_tio.c
@@ -1501,7 +1501,7 @@ int ni_tio_insn_config(struct comedi_device *dev,
 }
 EXPORT_SYMBOL_GPL(ni_tio_insn_config);
 
-/**
+/*
  * Retrieves the register value of the current source of the output selector for
  * the given destination.
  *
@@ -1541,10 +1541,10 @@ int ni_tio_get_routing(struct ni_gpct_device *counter_dev, unsigned int dest)
 EXPORT_SYMBOL_GPL(ni_tio_get_routing);
 
 /**
- * Sets the register value of the selector MUX for the given destination.
- * @counter_dev:Pointer to general counter device.
- * @destination:Device-global identifier of route destination.
- * @register_value:
+ * ni_tio_set_routing() - Sets the register value of the selector MUX for the given destination.
+ * @counter_dev: Pointer to general counter device.
+ * @dest:        Device-global identifier of route destination.
+ * @reg:
  *		The first several bits of this value should store the desired
  *		value to write to the register.  All other bits are for
  *		transmitting information that modify the mode of the particular
@@ -1580,7 +1580,7 @@ int ni_tio_set_routing(struct ni_gpct_device *counter_dev, unsigned int dest,
 }
 EXPORT_SYMBOL_GPL(ni_tio_set_routing);
 
-/**
+/*
  * Sets the given destination MUX to its default value or disable it.
  *
  * Return: 0 if successful; -EINVAL if terminal is unknown.
-- 
2.27.0

