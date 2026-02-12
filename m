Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED412D9EF9
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884961; cv=none; b=AGBIQX+4fmACV3kZjQYSyUQ7kBu22b9jAAMmdh703BWbuIT3GsReymULNr4Ty93Lbb8X3YGAkQTBpJeh6lsJUAln4v+UjpZzFxIoP2kM+LYnNdpOOU44OSUoN66REkKx0sl5wvRPFWF4oRC1T7QRBfW5CM1K7V1Bd3njlww2rrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884961; c=relaxed/simple;
	bh=nE5GSL32vP0J/x18oP4wnudwxXkJQH+0uX6gm4fNXPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJTOWQZPObir36KCBIgW9WtDtCdDOuHGttrHUzda778yCUwhIVs9C3Brq+8ePW899GP2XP7yL1uccqk6iZPuMF7FRVqlQpnerPiQW3gw8stN6I48zlITmUOitclEvRunZeMRw8cJus+3MTsD2IPVxsSGGUiXK3VIg1h5kINJDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2NB5CGy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2NB5CGy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee07570deso56939885e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770884959; x=1771489759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vpoTNOa4uraTPNZOgWATtAiJb3ObRPh5vlux7+e8zs=;
        b=e2NB5CGy1NBrfwz+SS+qb+1G3ZVrFQuhFo0Shxy8KhUNaz/rI32cd0ZpB1RNWchbAA
         7UN2XhqrIr5rnakEQy04QJjqFpiqdvr3ymmC/DskvLwG7H69I+TwWOIQ7xhSXFIy5YE6
         yCDmCEupEKiyjdSV+YOoGI2XjeNh4SutRJMOazARtUUg+Hn7ZTF74Jqf7zF7ukNik5C8
         dlj4/Ai1t0hoz2hN0OCkN37RgY45RpVOQzu5zXvLymmKK2ENOfKLnMLE3YH5NBrCF5kU
         htCiiXCEvWJKhW1B+S2ABaDZ38IYjvO5dUTzGO4aderhRisFYBm9L0d1hx9NE6J6kKo3
         xKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884959; x=1771489759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vpoTNOa4uraTPNZOgWATtAiJb3ObRPh5vlux7+e8zs=;
        b=Fd1bRSG5Pbgn3z11is+Pdek2OyOnj2g90C+IwtNJi4AeBXwTzLC/Fm8F2lc3hXLei0
         G0mhl2reb0deCV+NF85ggu+2X3vxLHRYqyspkWS9zI1/SkUh6bhHfIbAoQjVhuS+1VCx
         QYZP7q87DkZuKtkLCUG9u5FBigQHzMUoC8yJ5hkcmGiW88cEkOI7J7O53KD5gRer+dB0
         6GOQ/H0QYF9j8Fpsmk4QgMp7opIYU5xwNlQ+n3N9dQJ3AJ33EDIbPnpLoDJRgIe6ZE3H
         VSseOA/0bE8H3rZAbPMUFY4eTqEpOouesFOgjAazJwFgrXjErwWgFc0qWOlUPrV3tU9j
         ECbg==
X-Gm-Message-State: AOJu0YyC3a5M5BgebZtQSC052ycGYUBAeV4hZ5CwIOPzRAUS4KbWFb0A
	EJPzpUb57FW78zXRVvNrMPsPdP8rsFWkSUgwUXmbMIKEwRl1EKwff7UV
X-Gm-Gg: AZuq6aLNBte7xgclZCz52/8WRmEM+9IJklavBHTlFWORRSfcJg+Q4UHTlFexywKIyAR
	V0YJulbWCKCKD4wBJzczJ8AXMbpvkxrLpK96BiDysMYkXzkEX+IG0xJvraUR0I7e4W7/+ybGcp5
	UBtkA1lBnBFUq1obqQh1UeZLMGnU+LC8kX0FmdczdxGn+yR+L35ybaVaP0ZtyONZatJNcqfWD2B
	bF09AkEunOtpB6KhCyNm+nelrjoEHaB8Pt6N/pkkauSUZeUa87oTJ2mV+mU4VpCeDayIalABnX2
	W5r5Hm7EhtQ/HjcJeAgFuaOJASlEHc0fH+SLYnkST0jKV5QWiF5ZkH2QyD7HWtW4FsS6A/x7HVL
	BUTTZKEokGXnM2+mwaj3YAX69Xe8mnYraEWNu40zAkcjXLXQRPHHr0HjJruC1vYwTM0uiK4cbhl
	V8W+g3jT5NLjO1ztYoZgOdgH49MiMuGMaoGN4nF+TAbWVnVbvK
X-Received: by 2002:a05:600c:4eca:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483656adec5mr25922795e9.6.1770884958738;
        Thu, 12 Feb 2026 00:29:18 -0800 (PST)
Received: from sarah-VirtualBox.Dlink ([147.234.64.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a627c96sm59341245e9.2.2026.02.12.00.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:29:18 -0800 (PST)
From: Sarah Gershuni <sarah556726@gmail.com>
To: gregkh@linuxfoundation.org,
	sarah556726@gmail.com,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: fix long lines in rtw_io.c
Date: Thu, 12 Feb 2026 10:23:58 +0200
Message-ID: <20260212082358.3403-4-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212082358.3403-1-sarah556726@gmail.com>
References: <20260212082358.3403-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split long lines reported by checkpatch.pl to comply with
the 100-column limit.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index cc00ea80daae..a50939541cf7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -116,7 +116,9 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
@@ -134,7 +136,8 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 }
 
 /*
- * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
+ * Increase and check if the continual_io_error of this @param dvobjprive is larger
+ * than MAX_CONTINUAL_IO_ERR
  * @return true:
  * @return false:
  */
-- 
2.43.0

