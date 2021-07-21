Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84B72
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 19:34:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id ca14so3846802edb.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3h3q8SHUgg6wfPU9uDK9V1IUiRt6H/fJS2Uqk4LTjo=;
        b=jxVE536lO6V1V6YbIJNIe/q7qyRQ+FUijbpRPDb3t5x+boUjuTnlRZjfJf3x7SbmTS
         jGaiFq2muBjo9FV+NcDXqRh+AhriqXZoCmpC61kt2cOseFPSNTjiI2a2UBYokmz3JHS8
         Vvm+diE5hXoCulTMdQ6pvYpG1DaQarXcsiqUM26vkBdJEEjbZqPRKC2nFLk/iecr9HRK
         4Ih8EjfJVtGQ+eS2kDQMmDSeyJLmpbRCO/4IJWHPKH4mKz+d4sXubn/KgfyAB0sI73cZ
         /y5JzfFp8OH76znFvfxty1mIDyYmXJCa+6j2A+83rY2XBe/gX7OVks1SW5CF1cf67SrF
         6BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3h3q8SHUgg6wfPU9uDK9V1IUiRt6H/fJS2Uqk4LTjo=;
        b=ltUsCIzXy9KbTjBwG1/GTqapaQUcqRzcVaHj2qQBa9it72S9MVZGnCIuFS4Y8IZ5Sa
         bj96m9jhtwngLAvy1oQaMVG6ikkNJqtnfXFTvAt/4lQM1Qc8P55kHiCrEYEEuj9Y31GL
         wn759yy+cfsCgDTUSSVdnJtOblTZkbwjsTQ/O4uiq+C/Mxplf1mh8xK7vji674Rhs9dE
         0piQXcXrtno+IsL1zpF2wXmJDGvHE4lFHGhw2V+1nAc4nIflflGqF6/pht/YrRa51s4b
         7WXL71ZTsQPbTM9qtwZ+MiU8soSRx7Qp06VL/XQLghKkDOGG42dEt+aEVv/2uZsXErPM
         0xyw==
X-Gm-Message-State: AOAM531RSXLG1cOdYdYlE/bj6k5uggIWt3WG3OyiC8pjEyoUo6q5pUpp
	dcNZqMbUV5ASk17HsoN1Pvw=
X-Google-Smtp-Source: ABdhPJxRFnLhSyJCqIqRpa3F1lM5FPtP4S7QyYZtcJL110++SL15glECjzfv8GkcBbm2vMgSE4YpJw==
X-Received: by 2002:aa7:d3da:: with SMTP id o26mr50201686edr.304.1626896082588;
        Wed, 21 Jul 2021 12:34:42 -0700 (PDT)
Received: from localhost.localdomain ([176.30.239.20])
        by smtp.gmail.com with ESMTPSA id u26sm8611841ejj.4.2021.07.21.12.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 12:34:42 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	zhansayabagdaulet@gmail.com,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 1/2] staging: rtl8712: get rid of flush_scheduled_work
Date: Wed, 21 Jul 2021 22:34:36 +0300
Message-Id: <6e028b4c457eeb7156c76c6ea3cdb3cb0207c7e1.1626895918.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626895918.git.paskripkin@gmail.com>
References: <cover.1626895918.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is preparation for following patch for error handling
refactoring.

flush_scheduled_work() takes (wq_completion)events lock and
it can lead to deadlock when r871xu_dev_remove() is called from workqueue.
To avoid deadlock sutiation we can change flush_scheduled_work() call to
flush_work() call for all possibly scheduled works in this driver,
since next patch adds device_release_driver() in case of fw load failure.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_led.c     | 8 ++++++++
 drivers/staging/rtl8712/rtl871x_led.h     | 1 +
 drivers/staging/rtl8712/rtl871x_pwrctrl.c | 8 ++++++++
 drivers/staging/rtl8712/rtl871x_pwrctrl.h | 1 +
 drivers/staging/rtl8712/usb_intf.c        | 3 ++-
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_led.c b/drivers/staging/rtl8712/rtl8712_led.c
index 5901026949f2..d5fc9026b036 100644
--- a/drivers/staging/rtl8712/rtl8712_led.c
+++ b/drivers/staging/rtl8712/rtl8712_led.c
@@ -1820,3 +1820,11 @@ void LedControl871x(struct _adapter *padapter, enum LED_CTL_MODE LedAction)
 		break;
 	}
 }
+
+void r8712_flush_led_works(struct _adapter *padapter)
+{
+	struct led_priv *pledpriv = &padapter->ledpriv;
+
+	flush_work(&pledpriv->SwLed0.BlinkWorkItem);
+	flush_work(&pledpriv->SwLed1.BlinkWorkItem);
+}
diff --git a/drivers/staging/rtl8712/rtl871x_led.h b/drivers/staging/rtl8712/rtl871x_led.h
index ee19c873cf01..2f0768132ad8 100644
--- a/drivers/staging/rtl8712/rtl871x_led.h
+++ b/drivers/staging/rtl8712/rtl871x_led.h
@@ -112,6 +112,7 @@ struct led_priv {
 void r8712_InitSwLeds(struct _adapter *padapter);
 void r8712_DeInitSwLeds(struct _adapter *padapter);
 void LedControl871x(struct _adapter *padapter, enum LED_CTL_MODE LedAction);
+void r8712_flush_led_works(struct _adapter *padapter);
 
 #endif
 
diff --git a/drivers/staging/rtl8712/rtl871x_pwrctrl.c b/drivers/staging/rtl8712/rtl871x_pwrctrl.c
index 23cff43437e2..cd6d9ff0bebc 100644
--- a/drivers/staging/rtl8712/rtl871x_pwrctrl.c
+++ b/drivers/staging/rtl8712/rtl871x_pwrctrl.c
@@ -224,3 +224,11 @@ void r8712_unregister_cmd_alive(struct _adapter *padapter)
 	}
 	mutex_unlock(&pwrctrl->mutex_lock);
 }
+
+void r8712_flush_rwctrl_works(struct _adapter *padapter)
+{
+	struct pwrctrl_priv *pwrctrl = &padapter->pwrctrlpriv;
+
+	flush_work(&pwrctrl->SetPSModeWorkItem);
+	flush_work(&pwrctrl->rpwm_workitem);
+}
diff --git a/drivers/staging/rtl8712/rtl871x_pwrctrl.h b/drivers/staging/rtl8712/rtl871x_pwrctrl.h
index bf6623cfaf27..b35b9c7920eb 100644
--- a/drivers/staging/rtl8712/rtl871x_pwrctrl.h
+++ b/drivers/staging/rtl8712/rtl871x_pwrctrl.h
@@ -108,5 +108,6 @@ void r8712_cpwm_int_hdl(struct _adapter *padapter,
 void r8712_set_ps_mode(struct _adapter *padapter, uint ps_mode,
 			uint smart_ps);
 void r8712_set_rpwm(struct _adapter *padapter, u8 val8);
+void r8712_flush_rwctrl_works(struct _adapter *padapter);
 
 #endif  /* __RTL871X_PWRCTRL_H_ */
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 2434b13c8b12..643f21eb1128 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -606,7 +606,8 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
 			padapter->surprise_removed = true;
 		if (pnetdev->reg_state != NETREG_UNINITIALIZED)
 			unregister_netdev(pnetdev); /* will call netdev_close() */
-		flush_scheduled_work();
+		r8712_flush_rwctrl_works(padapter);
+		r8712_flush_led_works(padapter);
 		udelay(1);
 		/* Stop driver mlme relation timer */
 		r8712_stop_drv_timers(padapter);
-- 
2.32.0

