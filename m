Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126D426EBB
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559576; cv=none; b=dTAsr+YqNXzqA0LneZWD0YxfJleG29mJ0LzCrkMbRIfHYTy7LmJKmFUVYWCMB0AEkFR/BguwnG4+kn3MHjSeTopzTnCxFBwrpjgr4xpeyOwDBfV1svcgQyAY2EgZ5xpDetZ2aQcJf0br91HZ7ahvvxTPXwMQV9bPopae9iJ5A6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559576; c=relaxed/simple;
	bh=rRaf4dUWLDwtU4GBT/Qey4CJq/9F/VK5STqEmHCXBck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNtmrTz3I6zbx1gGVteGV7ZaVxn8JdbxExN9WJeLWoxADFFMJYblDykc48khbweCgBS9pxchqvaNZUGxpmNVC9uZusnPzfRDeN/c8mgrlbdKPdBO/AVGSFr9qVpv15jnW9jqsTxVFs1RUwEslHF+ac0LtlmNDuRVr3YUPa0UzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZCyTLQe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZCyTLQe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b790af67so1469733f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559573; x=1773164373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtWdFsDcfyY19ene8l4YHWz4WIRQnnEwqi+y9f6dfow=;
        b=hZCyTLQetVp+030mpGO7SyVk+Ex8Pl+k7k4M87qCQNrb5zRv+Zg3VbokD4oCy0lPyO
         U4OSCQTzouWlVjg8Rj4Rg4t6byT1JlOx/7wqIkz3imaPeBdDQf0V6LEIxERQrAiRIil8
         aPtdhfWHjvxverTyjgsAGqWYOANizSQxfU+/s66SKFKcOGuCTdXLDCD5LTPWGJbHrrjp
         ERGD+2HUxU/7/NjAZwlMMolkojqMB2y4gL4K5hmTc656tfNxT4DJUTRHuEgT1BgIbWGG
         pMb8xHNFMrWAiJIe23L7ZE4TWGfAC0mqUiwOUh6jfeVl35ZKhAJ7l5VmCDzro30knjcl
         O02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559573; x=1773164373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtWdFsDcfyY19ene8l4YHWz4WIRQnnEwqi+y9f6dfow=;
        b=Q8Yjvlukqndo0wD1ZGvFvJrXGmcqHVJO8mhxTnRrke0VZjyFZ0i2nDLyTB4YtVN4s5
         lLXC5VQa8VEDArSDMKvwVjUxXytqBvpBoPAhbq7abwxOA6mleDuq9GBMDlr7VZUjwsGb
         1WVaHzTg/mA5OSuSl3FK04TRfoUxiNFq/H+0m3pbf4NJlEEryNCpmBF/ly31SI+XiCcw
         6HwtGZw/y4f1wi2jKYh8IrtWM8Juh4HwQLnEOUuMna9ASpimGRFVlLyDn5zgz/kFRKtT
         jsFf/SEB5T6/pAAah5qP/0yLSX4YZ8nlsgDn7Yz93DBOZ2+kkEgr+h2yMMN18Wcy6DB/
         DEaw==
X-Gm-Message-State: AOJu0Yx8fN/PqQqk2ao0C3A72NQ6JlrW9ak5FIDWq2044drh9JyNBA+k
	mmlxzXYuw3Bhp3fU5b7y1QW/UwmmOTu7QyrZEmdhI6eVhLCXKhztL3prcLZ+dja3QZAhiudQ
X-Gm-Gg: ATEYQzyrH+oMTsoYZSGzMdfAlho5ME376Un/nnC81GQyVmfkLbP1ZskwaXJGQGIjs+8
	ReLk0k1Mv5hyyL8SKtik3qX2xSSaPF8uxWTkRHsILwcQdX/FXht5dj2yIvmMH3S00T2KHq7629X
	sIxuLXCOgFPNCXSlFvHN8xq8sTAF0IHeG/owFd8JnJ3AfA7vlFjFBuSZuxIbzLeeVc8CNxRwQOi
	Ve4cGN3gu6GSD1dXPn5qtt0XqWEHdEmXdOqHGy26ybYAKu4c+Hx8hJySjMJfOl1Mw3DfoeUO+B6
	quSBTrNeIJmrb0jN3KwBQ+E9869Q8bcEbj9f2vHhmWGUD3FnhL3fYmZEzNnLhvsZGJglneMIiP+
	b7VohuGWgC+mhvgz5kFuOjnPmFILkQqQGYo9YvIKIr2lo64UOlItQBS7/9gHXxQtCJ9bjCMty6g
	fBkFojYh5h2EAnQP9YLA7v9AYsFmtO/XGS63+QtkA=
X-Received: by 2002:a05:6000:178d:b0:439:9812:35ea with SMTP id ffacd0b85a97d-439c108ceb8mr5146841f8f.3.1772559572791;
        Tue, 03 Mar 2026 09:39:32 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm16701884f8f.17.2026.03.03.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:39:32 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Ingo Molnar <mingo@kernel.org>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8723bs: fix indentation, line length and declarations
Date: Tue,  3 Mar 2026 18:38:30 +0100
Message-ID: <20260303173844.47975-5-azpijr@gmail.com>
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

Fix indentation to match opening parentheses, wrap lines exceeding 100
columns, and add a missing blank line after variable declarations.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 2312fc42a619..ec5753dafc2c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -113,7 +113,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 	}

 	if (pxmit_priv->free_xmitbuf_cnt != NR_XMITBUFF ||
-		pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
+	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
 		netdev_dbg(adapter->pnetdev,
 			   "There are some pkts to transmit\n");
 		netdev_dbg(adapter->pnetdev,
@@ -325,7 +325,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }

-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
+		     u8 smart_ps, u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);

@@ -352,7 +353,8 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			hal_btcoex_LpsNotify(padapter, ps_mode);
 		}
 	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+		if ((PS_RDY_CHECK(padapter) &&
+		     check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
 		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
 			) {
 			u8 pslv;
@@ -444,7 +446,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
 				scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 				pwrpriv->bpower_saving = true;
-				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
+				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt,
+						padapter->registrypriv.smart_ps, 0, buf);
 			}
 		} else {
 			pwrpriv->LpsIdleCount++;
@@ -981,6 +984,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }

--
2.53.0

