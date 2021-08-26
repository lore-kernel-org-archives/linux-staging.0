Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6393FC7
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 01:50:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id i21so2614239ejd.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=80RKC35nU1+RD8O7RmvEN2Hh0WXweIkEFW8Ee2YLI4w=;
        b=vNRYxUYzc07cs3ZouSO8oHGLtJNMpg1T0+c4OS+qmQ9fGctVUYfIPA16xesPj2fYUB
         uRup2fqKKpm/AsonQ2FBN3RypC6oy7eN5GHa3SyXs7ht4/pfCPA8kpBxdNA1x02ncq/K
         nH0lLecLnDF35cXRXYBGu+dxSq5SmIZl/25YSJ4KxAvf1PclPfd6Ygl6FamgrVEIdDQM
         yOz0UWJ69wAWXfcPTl5Ok0OQZCo64YvxY2R3vRoGjiKbD8jowMoXkK8fas0jkRxQScqc
         yFVehrQH+kA2v8QNDO8jUPBCiALhSs2gjITOtF09NzO5r61HdpHu2EioMLTgT+m2FK1j
         zliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=80RKC35nU1+RD8O7RmvEN2Hh0WXweIkEFW8Ee2YLI4w=;
        b=Q949t/mON7T+pCKLZdjqsdhMS5dZUY3uBeC4pRFaEvMs+T5dVLlHX1asgPqEm8jCDN
         cHggrspN8qEYIFTGYCZ93QWlB+tz+llnE69WNGVzte1qnRT1adL0Molu7/Ymszhe/phX
         pKdA7hL39eXUeAWXMYBNKTOu1Vvq4mWZA6McMEc2hNLKrp1D2X7jRQrAK1zGN9ID5sl7
         lIbK5Zn8lq5cNnbkNHiZfcUl45XrnnMqtIotb46+sYh4sgnrf6b7kdI1o2jfiPsXyngW
         3wOUjuHTm4W0qAjcp+Gx3Z9TwuT8OvpOC+DuSN5TzRmvXp4XXdcjkH+U3pJhd3C+9tyx
         AS8w==
X-Gm-Message-State: AOAM532VyArO6YrS0XLA28vVP3nSxNonLc4BW7l/EbJOzmLaTeW0AsJK
	m3X3S/sT2BkSxS00R2eWRsE=
X-Google-Smtp-Source: ABdhPJxFwcYTuMw8e9XJUjGCoAjWOF/JCHjjA/JhRYRxxUMxnFi/VoDMZzCsV3rrXVrLHREgI406eQ==
X-Received: by 2002:a17:906:9388:: with SMTP id l8mr1589658ejx.307.1629942607754;
        Wed, 25 Aug 2021 18:50:07 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id u9sm845358edo.37.2021.08.25.18.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 18:50:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Provide a TODO file for this driver
Date: Thu, 26 Aug 2021 03:49:59 +0200
Message-Id: <20210826014959.26857-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a TODO file that lists the tasks that should be carried out in
order to move this driver off drivers/staging.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Thanks to Phillip Potter <phil@philpotter.co.uk> for for providing the first draft.

 drivers/staging/r8188eu/TODO | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 drivers/staging/r8188eu/TODO

diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
new file mode 100644
index 000000000000..4bccca69abac
--- /dev/null
+++ b/drivers/staging/r8188eu/TODO
@@ -0,0 +1,16 @@
+To-do list:
+
+* Correct the coding style according to Linux guidelines; please read the document
+at https://www.kernel.org/doc/html/latest/process/coding-style.html.
+* Remove unnecessary debugging/printing macros; for those that are still needed
+use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
+* Remove dead code such as unusued functions, variables, fields, etc..
+* Use in-kernel API and remove unnecessary wrappers where possible.
+* Remove the HAL layer and migrate its functionality into the relevant parts of
+the driver.
+* Switch to use LIB80211 (This work is currently in development by Larry Finger).
+* Switch to use MAC80211 (This work is currently in development by Larry Finger).
+
+Please send any patches to Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
+Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>
+and CC linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org.
-- 
2.32.0

