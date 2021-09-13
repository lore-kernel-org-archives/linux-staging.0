Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD632FAF
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:11:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id b10so16261940ejg.11
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LnBTGNu7QgkLzhoHA3MEph2XIWh5Mopj9gFJxhRbNc8=;
        b=DO5m5HEzOans/qXDbfUqJgF0GH3yjlEBUg5e0fIiTqOjsjWojUBLJnHwE8oxPfVMSP
         DiWCyiKalHHXD9x3ak/Y/sHZMBjF+PZrRvqr01ryzJCwyIozw3v0DWOd0dz07JaX03Mj
         8nPMcg1OkpzgiZ98+njyl69CB8F8FNGxhYqD7iL0hyamJjWxtH2NXwcj2KcFBrHQ17dC
         +XAWoepU9imWQ7nYP9N8SwHXoOPbicZvVTZ2rEI8mpJ7LrUz8MmW5eQhrllBc43HwptO
         PJixWDZvQQ6jK6zX3BTjDMuAYJamFPf7reYLohxzS3jbKlv8D/rPA+v5MuMcioKuWFX6
         UR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LnBTGNu7QgkLzhoHA3MEph2XIWh5Mopj9gFJxhRbNc8=;
        b=B41mE/SQZOU0+LrJT1EBcgfKwntxcc9Pqe2ufzk0gxB9lybSQnAz0Lax+zKnWIg0Ql
         oI8NHc1tSr2rwl0SUb7RFqYkYpeTeR6AFUMjY9ip07UxBGpItQH8QuJ1nbkfAqtVBxDh
         Sc5VzIuLAaPdRF0SfIOF2+RBK9xVoshslVBjuOA2j5QsKlmPIuekTsUWJGLjtR+4CWX5
         poIURxxADHjT25hOP2TBpQfmfKics7IEjttPvuX2a310dQh3/sG4XbwxF875hAbaAU/n
         PPosOeVu61/4mJOKBAlN/DfrBNzzxoECJk0aS3O7FyAxj3MUuc02pztp5TBG48+KipOf
         09Qw==
X-Gm-Message-State: AOAM533sZByTAygTqcmToc72qG+jr5zs63D2O5u7L6m28ZhGR29QSjbt
	76JJyJ5a0KJAseA+zG1/vuKDJLwkcbk=
X-Google-Smtp-Source: ABdhPJz4lD3m9FRvj2USkXgZ7+CUhdH53dqy3M2x4APxCBIlEnjjSIo96RVVkc57LVZZtN7whmKTfg==
X-Received: by 2002:a17:907:1de0:: with SMTP id og32mr14085655ejc.348.1631556665998;
        Mon, 13 Sep 2021 11:11:05 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id d25sm4258999edt.33.2021.09.13.11.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:11:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 06/18] staging: r8188eu: remove the helpers of usb_write16()
Date: Mon, 13 Sep 2021 20:09:50 +0200
Message-Id: <20210913181002.16651-7-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913181002.16651-1-fmdefrancesco@gmail.com>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Skripkin <paskripkin@gmail.com>

Remove the unnecessary _rtw_write16() and usb_write16() and embed their
code into the caller (i.e., rtw_write16()).

_rtw_write16() is a mere redefinition of rtw_write16() and it is unneeded.
usb_write16() was the only functions assigned to the (*_usb_write16)
pointer, so we can simply remove it and make a direct call.

This patch is in preparation for the _io_ops structure removal.

Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

v3->v4:
        Split a patch into fourteen.
v2->v3:
        No changes.
v1->v2:
        No changes.

 drivers/staging/r8188eu/core/rtw_io.c       | 14 --------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 10 +++++++---
 drivers/staging/r8188eu/include/rtw_io.h    |  4 +---
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 69ab6e24a4b7..7547e25d870b 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -34,20 +34,6 @@ jackson@realtek.com.tw
 #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
 #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
 
-int _rtw_write16(struct adapter *adapter, u32 addr, u16 val)
-{
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
-	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
-	int ret;
-
-	_write16 = pintfhdl->io_ops._write16;
-
-	ret = _write16(pintfhdl, addr, val);
-
-
-	return RTW_STATUS_CODE(ret);
-}
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 69e64863a5d1..128cdb178abc 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -145,12 +145,17 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 	return RTW_STATUS_CODE(ret);
 }
 
-static int usb_write16(struct intf_hdl *pintfhdl, u32 addr, u16 val)
+int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
+	struct io_priv *pio_priv = &adapter->iopriv;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 wvalue = (u16)(addr & 0x0000ffff);
 	__le32 data = cpu_to_le32(val & 0x0000ffff);
+	int ret;
 
-	return usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+	ret = usbctrl_vendorreq(pintfhdl, wvalue, &data, 2, REALTEK_USB_VENQT_WRITE);
+
+	return RTW_STATUS_CODE(ret);
 }
 
 static int usb_write32(struct intf_hdl *pintfhdl, u32 addr, u32 val)
@@ -550,7 +555,6 @@ void rtl8188eu_set_intf_ops(struct _io_ops	*pops)
 
 	memset((u8 *)pops, 0, sizeof(struct _io_ops));
 	pops->_read_port = &usb_read_port;
-	pops->_write16 = &usb_write16;
 	pops->_write32 = &usb_write32;
 	pops->_writeN = &usb_writeN;
 	pops->_write_port = &usb_write_port;
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 3b229027f094..0cb1f626a549 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -253,7 +253,7 @@ void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 void _rtw_read_port_cancel(struct adapter *adapter);
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
-int _rtw_write16(struct adapter *adapter, u32 addr, u16 val);
+int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata);
 
@@ -271,8 +271,6 @@ void _rtw_write_port_cancel(struct adapter *adapter);
 	_rtw_read_port((adapter), (addr), (cnt), (mem))
 #define rtw_read_port_cancel(adapter) _rtw_read_port_cancel((adapter))
 
-#define  rtw_write16(adapter, addr, val)				\
-	_rtw_write16((adapter), (addr), (val))
 #define  rtw_write32(adapter, addr, val)				\
 	_rtw_write32((adapter), (addr), (val))
 #define  rtw_writeN(adapter, addr, length, data)			\
-- 
2.33.0

