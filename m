Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2EB6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u21so29036433ejo.13
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNq63xydxKvI5xFGmqp0pc9swVuTSAsAgkYAFaeO+Es=;
        b=BaflAGtKksJ4Wkm0WJlgrPoFz/hQ1+qjj/X7RumaHBxS9X8qh1u+ImzDbFo1rn20xp
         Q8UyQCeYdA7KsRUiIGXVuagqJ7OeTgjB3z4WSPv7hZGMCgm1Q0cX4m3X3ppapDX+10/C
         c8a8Y6vt3YInO4TLB9ZU/mp1DvwZAGkWB42v1d/X+PPvyUykRyZaZSbYww2uoItTQMgV
         V2bgtcdPxeEx57uNIOh94tBcgwtCSlL2RVhgWrcuFNVMfLryoJrl+VPhtbnIWLnLSFvI
         4C3+TJbl8btOkat6aRK4YNlU2SVRQq0+Fw+owUW2rX5jHQQLtKsb1rwzw6ZLjvOzg0Ec
         NKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNq63xydxKvI5xFGmqp0pc9swVuTSAsAgkYAFaeO+Es=;
        b=ctWYbm8Db2mGbiz+xfdyXj+TOt1LIooNbuD02V61neqM6JOgRwVYN82k2rdjnOynhZ
         F1BfA7cplreBq7x1MKs7T9Uikdq+WPQqcjqS/rMV/A6bFlIhgPHof/JyWi9J+xzRhnsE
         z3ev1hdXnUmV8v/uzI5gGrm6xaF+1s5758fWP9RlfML5hVzxIeoLrRMbqFpObqo8NGrK
         Qbh32yZR446z04yMs2fFj6YQEM8VO0YU9UQg+mwhpvzAQ0Ni7YcfnEo5JzwJ8hnjCnCV
         W44jVrZv2k3tQP6bKmx06GpQmRKPRM1e1oWG6KAGCTRjC947gd4yJRXpqc89TU5ridUL
         G0Sg==
X-Gm-Message-State: AOAM530Euf4JM3rrYsc6SAZwrW5joAGlDh9dUObPwkRFh5edj5wyjn1R
	uOKiN27dpqhy686eII+HaPs=
X-Google-Smtp-Source: ABdhPJzfDLgX7sZ9tk7tl/vYS/k9r5MmjnBH8KOqL7epRhxuQKFW5dv9guO7BqYpj35NNZfkNI8cEQ==
X-Received: by 2002:a17:906:7150:: with SMTP id z16mr2498112ejj.103.1617183668752;
        Wed, 31 Mar 2021 02:41:08 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id c15sm831516ejm.52.2021.03.31.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 30/40] staging: rtl8723bs: remove commented RT_TRACE calls in os_dep/ioctl_linux.c
Date: Wed, 31 Mar 2021 11:39:58 +0200
Message-Id: <b46df7766fe0a1a8c5cf8367181e5539e7e4fcf4.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in os_dep/ioctl_linux.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 354441e6a667..aee4932162a9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -4231,7 +4231,6 @@ static int rtw_wx_set_priv(struct net_device *dev,
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct iw_point *dwrq = (struct iw_point *)awrq;
 
-	/* RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_notice_, ("+rtw_wx_set_priv\n")); */
 	if (dwrq->length == 0)
 		return -EFAULT;
 
@@ -4245,11 +4244,6 @@ static int rtw_wx_set_priv(struct net_device *dev,
 		return -EFAULT;
 	}
 
-
-	/* RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_notice_, */
-	/* 	 ("rtw_wx_set_priv: %s req =%s\n", */
-	/* 	  dev->name, ext)); */
-
 	#ifdef DEBUG_RTW_WX_SET_PRIV
 	ext_dbg = vmalloc(len);
 	if (!ext_dbg) {
-- 
2.20.1

