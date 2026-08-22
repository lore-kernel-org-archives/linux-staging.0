Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B135F162
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423048; cv=none; b=bazrKrlhUX2TwysWIxJkm/L3a+uNQl7W0t7SgwqAmRFzntBgw3tzdzbiNhPeMNajjvUdHFzAdOGgA/oTRmb3ou4EHYmprC6CmvZeZdtnxuUWd1dGX2jREskSjN8a6OSJ9bq9mIRWGuEV51oMCAf9bc3br28dqn+jsn/LOSIUkWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423048; c=relaxed/simple;
	bh=4j2u/2LK/nuNPuwH1MQq7NHIaJehY/Q8+6f98m69S2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg2lLqWd2K5yfY4+aXN7A1EOZZ1LtL1KSXJEP89yYMfGGhaD8zZueMWUcp2Re4/AEgLHxK2/vR5xiLVp79IgvGmqiHBUfPVN/bCEMbwlRau3n5r5ohwjeZfPF4YRL2KSyJ/WugxIadDUeVCnGgQ//H6uWiJB6k50rSweo6ro52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGJ9q3JA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGJ9q3JA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso23397655ad.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787423046; x=1788027846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38lpnJUb+9u5De1qLeJIv/gKBuF97TxtsU+TUNQCyVQ=;
        b=VGJ9q3JAuRiNHsUXLV/G/0CERy2aZiwMt/6b6VzXRvlHlwGCG/l8fLC7S5A35r/u2K
         qvQJ27iSGBJyu5uOxut6IxzJLm2z/u2QKGIv3+4D43UFhZFjl8OYJ5vRhSxNUSWKsPRX
         Q47U0plMYibGFaY+M7o8/cH55JpgEzewlAnu8TzxrImrAtA0c0S8RkXHFB0p4YVQZNJM
         zSBmqOZpLNP2JlCQD/NWLXzJ2/rlCYwylUgSnrz1bUZK2lC/t7IdZ+Oldvn9XPq+8Jsg
         yq/9x2KgJhqBhekMu4uoYLpg75vB2oiZZECNyuLaTCJXqukOSvKvqWpA1IXan0HvHPDh
         TPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423046; x=1788027846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38lpnJUb+9u5De1qLeJIv/gKBuF97TxtsU+TUNQCyVQ=;
        b=LNnKtI1qXNR2V2t4P3vi0hIoJMR44oelPovatgjtRDDaHmwJwlv9iZKd1gldXjSFZB
         rPvkQgkrfxMe0COJ9MVVUZOhllL/SsprTYXs4P6vqL5HnXdn0SG+DH1i1/g2TaG5m4Wx
         OvmjtIuip9ABmGxQ/Yd0lnkOamI8i8r7w98q/xexDIswhlvoqdxjAsxwLhCLZBc1OOlU
         0YyFxd7xw+osCg5ga/5HSd+pZzlgaOrrH6EvxSAsgfCZYbVzdoaW1kVddpRvg54WKd0P
         5LGTYykHXmBZr82r0Lj3VQUz9fBepmK/LUI+MzBFQ6NJcpMq10AzkQDLV3d/M5VkD0n7
         iyKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9d3XStrEBKBT2JaV8+qJlUaUTqCk3j91gTqx2mLysOdvgpjU7/Y3jWbBdz7ODLXXDWs856gmZkErHy41b@lists.linux.dev
X-Gm-Message-State: AFuF++nDoaguB5g7+64L1sTVHEfvQbPICWD8Mze1TSzjxwUrxcDgSueI
	rF0QIdE0vKx3KeJeXy5PlEG3BmUvNF9cSm4bIS9jvrSzRj4U2Zy6U6Ch
X-Gm-Gg: AR+sD11WZjVLJ4r/pYR7FvCamAoxcOf8VMGObEnAbvPnUAALwCYibgeKUCKqx+Z7+5o
	WLjzWF858ji/FUsQo5USpLEqpLHr92N+PYN8CkOXQxWdNvqq8LhVSTxcK+OtN4QgXWbLes8juQD
	1sLJeC87uPiTNF/ibKa8kIrWoDtqWkuV5+j4NMvAVzm0U9zHkHS18PDAloFNr7sBgXzG9EgSpQc
	/4iW0luKlSsM7q9502b2v1w8MZRj4JBEtRuK1zAG4yk3qkE/vjFT02EHlg1jwWfhREDzzGFfJIk
	BCf3megSw71jVpxiGGqdLe4FybGOIkD4vH1K9O/kiYme8i+XujYWuXjM+GlRlOXjARWDhOHVSMQ
	LpJlFMIKIsp8GsmwBroTjPn6wQEbNgRuQsKuQ3+Zy3gIKJiug8GB/hR+ZYiuHH3vnUM6P35Yk8X
	bIZ2xxRwhFUyJfPcj2jP+vmcx+Jdp4/Wz6A4T+YTH1FHhkyoTK3JrDh6ssG2y8dSyvvoZdkG4Ok
	bYkrhrFfdgqWg1kzFUxLgteEF+HAHJJIjg7wzXwCr/3vVbH7qwheuPNUMAKQfkcU3g1wEvUwm7Y
	IF8sALeKHkV8s5Fs1QkPyQdf
X-Received: by 2002:a17:903:26c3:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d64b0c72d2mr305473045ad.12.1787423046326;
        Sat, 22 Aug 2026 11:24:06 -0700 (PDT)
Received: from i-use-omarchy-arch-btw ([203.110.242.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm13677462eec.16.2026.08.22.11.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 11:24:05 -0700 (PDT)
From: Samrudh Nelli <samrudhnelli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	azpijr@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samrudh Nelli <samrudhnelli@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: use guard(mutex) to simplify locking
Date: Sat, 22 Aug 2026 23:53:46 +0530
Message-ID: <c48daff1c9d31051e6e8bbd3611ab3b18e0d6d7f.1787421961.git.samrudhnelli@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787421961.git.samrudhnelli@gmail.com>
References: <cover.1787421961.git.samrudhnelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace classic mutex_lock() / mutex_unlock() pairs with the
guard(mutex) macro in functions where the lock is held for the
remainder of the execution scope.

This simplifies the code, eliminates the need for goto-based
error handling (e.g., in cpwm_int_hdl()), and ensures that
locks are always released gracefully when the function returns,
preventing future deadlocks if new exit paths are added.

Functions where the lock is intentionally dropped before the
function exits have been left untouched.

Signed-off-by: Samrudh Nelli <samrudhnelli@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 33 ++++++--------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..18163a3dbade 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
+#include <linux/cleanup.h>
 
 void _ips_enter(struct adapter *padapter)
 {
@@ -37,9 +38,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 int _ips_leave(struct adapter *padapter)
@@ -337,7 +337,7 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 		if (ps_mode == PS_MODE_ACTIVE)
 			return;
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
@@ -383,8 +383,6 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 			rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -578,10 +576,10 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 
 	if (pwrpriv->rpwm < PS_STATE_S2)
-		goto exit;
+		return;
 
 	pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
 	pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
@@ -593,9 +591,6 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 		if (pwrpriv->alives & XMIT_ALIVE)
 			complete(&padapter->xmitpriv.xmit_comp);
 	}
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -744,7 +739,7 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, task);
 
@@ -754,8 +749,6 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 				rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -871,7 +864,7 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
@@ -880,8 +873,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -907,7 +898,7 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
+	guard(mutex)(&pwrctrl->lock);
 
 	unregister_task_alive(pwrctrl, CMD_ALIVE);
 
@@ -917,8 +908,6 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 				rtw_set_rpwm(padapter, pslv);
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 void rtw_init_pwrctrl_priv(struct adapter *padapter)
@@ -1108,9 +1097,8 @@ void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny |= BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -1123,9 +1111,8 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny &= ~BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
-- 
2.55.0

