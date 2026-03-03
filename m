Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20985481FBE
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559568; cv=none; b=A41u4C4EBlf2dJM47STAv7HJwSwCg+z729GFH30KnG3HlpcUV6Mipb+T1kvXap6HwCk7WF229tG/SezmpprJ74DKXbzNhupYdp+N4j3mvzwa9tfat21oDCQ8q2lsICVlzCSvA8jivnDFHvhxkKspt1TZGuvrsxlz8Qhg8GSETK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559568; c=relaxed/simple;
	bh=Yu9f3nU/4TcdSuEycvE/CNXJCKMNmDY6rT7JcTUHXD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwIPnNlaL+MdwsAqqOFsx9J5KBpqdR/lIAYOQIqAVsMOMiTyouS3QLDbtoy4tu0iqlVYVGv95bsT4sKC1WDeZKPEXWf4MnCT3uSUpjwEf9eCKnb5rgoaZibWIkKtljcSIDG/McH3ytnSP3FgCQa1Bn9O6a62lEiJVBbsy6MSzJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUMxs/cL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUMxs/cL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1390395f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559565; x=1773164365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e+RXIlEZYq3YEti1DgPuYIPgozNPJKDhsplw2LSz70=;
        b=eUMxs/cLFnIPT+f0RENFaoRWV0QnYFRTPzCKtP4gZti/aPDt6MRgZetbUzJqz+Gfb9
         Xg8G4L5uosEa7LGScW1fKTLMUu8O1RAM5B0G8SNef7xg1RQ75te8Imnuq/ImNGd0U7Z7
         oRN7nvUr+zcvKAaewLGYczINMDFnIewZm6uMFRLWng0xVebA3WaUXSYuJcchmZkInwlq
         HlaugD45suOXzWKBCzQTF3L3p0hITvAXPio48n0oN0SmBwFhStYZhAg5pwfSulXBIx2S
         bMTS/QamaXy4Yv8mIJIQhA3Ft+JQyn7xkAd4rusaAdT4Z7UKxKnZHidfz0vOq56xEtH9
         XBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559565; x=1773164365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6e+RXIlEZYq3YEti1DgPuYIPgozNPJKDhsplw2LSz70=;
        b=GNijGGyEj7jQDlqsAwOcwcfYarqWMMnhBjclX1hVku9m8Dol00+vRXL2CV+zE3kcrA
         MFUkcrfCnC4qwOr7eeGjaBMpqQifh6G9+CKzrEEYXmSkHyw5fGo5ALFS1WvyxDcrcRmm
         NwwBAXeT1d7LVYtE5b7EoASY5ACeQFvP0aNIeDzEbIyh9sVzH8IB6XTPSXk1/h9mh+3j
         bL6VwNwgqgqQuM2uaEDejcA9gBD3CIzivViuJrbwpk6QYWfKhUItI9F7NRx42/n9rykD
         jEz05GSrAJORxqAiCiJDThsslRiQJ6an4yePHGVpYAdTBPXQHS/BU6PAl6vn6AsaW24K
         96ng==
X-Gm-Message-State: AOJu0YxwvloB4yb+s39q0fijxW4IA3b+QMMbBsna1L6WwRouf+CW59Hg
	YsERIg8zjzuP2RQCvXJRv+KM6LCMPs/CxaS0RcH5vtbnMvsdB90e1ikU7Nihb9ks8e13qNdT
X-Gm-Gg: ATEYQzwYgVeGgs6NfHClWl7zLWFQJeOysInXSh2NIpH5fzb7XPNBXVqBwQ3OaX4AXxH
	AXmThIJ9vvzELClJTxfjoPtFQK0L35XDvWND3NqxUotBoOEpDANJ5wrAwxZ+EtvLN85Onjfquh3
	GKuaqn1evqFb+oZBD4sIC6bBeU0Db7ngqbVWi2TuoXB9T4OI1oduIWaIX8sCzXtfyv89XTfGNij
	IoiVX+6Uk/0locAPgdbJ9eEtTBJwLAGIFfVUCiTS9eXYe0pQr7f08rvmu04HcQNzmq+aV+pVAFs
	Bfxbb22tUQG9wmBpdY3E/kNQwGEwN8u/6qfs87JysvvW++vOR7LyImPMVRGkIONBGycn/+L29Dy
	yJbo4ldXyKWjcIn8N9JMQ4I70arFviUz3umPRi9JFCjKyddjLH3kjNfiiClC95bf59nJ1aXs/6E
	jCN8y7Sm0mboc3QGu7OH66H/eWjLAqOzSJnBy+yp4s5chGJ9G/yw==
X-Received: by 2002:a5d:5f55:0:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-439c1104378mr5642693f8f.16.1772559565247;
        Tue, 03 Mar 2026 09:39:25 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm16701884f8f.17.2026.03.03.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:39:24 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Artur Stupa <arthur.stupa@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8723bs: curly brace consistency
Date: Tue,  3 Mar 2026 18:38:29 +0100
Message-ID: <20260303173844.47975-4-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303173844.47975-1-azpijr@gmail.com>
References: <20260303173844.47975-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix unbalanced braces and improve readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index e75dd21b3390..2312fc42a619 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -286,8 +286,9 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 				break;
 			}
 		} while (1);
-	} else
+	} else {
 		pwrpriv->cpwm = pslv;
+	}
 }

 static u8 PS_RDY_CHECK(struct adapter *padapter)
@@ -445,8 +446,9 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 				pwrpriv->bpower_saving = true;
 				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
 			}
-		} else
+		} else {
 			pwrpriv->LpsIdleCount++;
+		}
 	}
 }

@@ -750,10 +752,10 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 	unregister_task_alive(pwrctrl, task);

 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv)
+		if (pwrctrl->cpwm > pslv) {
 			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
 				rtw_set_rpwm(padapter, pslv);
-
+		}
 	}

 	mutex_unlock(&pwrctrl->lock);
@@ -1073,8 +1075,9 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 			pwrctrlpriv->bLeisurePs =
 				pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
 		}
-	} else
+	} else {
 		ret = -EINVAL;
+	}

 	return ret;
 }
@@ -1090,8 +1093,9 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		rtw_ips_mode_req(pwrctrlpriv, mode);
 		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
-	} else
+	} else {
 		return -EINVAL;
+	}

 	return 0;
 }
--
2.53.0

