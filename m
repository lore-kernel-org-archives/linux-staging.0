Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531932C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 20:30:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z29so21530243edl.7
        for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUNrx9kbSPTQRQvxe26IZvVu40WIMjlDMxWcOQUeOik=;
        b=qSru67JuO9ntAk2o23RoIzyKPCjffhWevDxX9+aI6nwR6ByItmf8GLwydlOeHbxOva
         mKD1JqMG+dDnDAfNfBRQblmgf3Uabz0T78GCnUj3x/AqezfiyYNQrUhSIRH2ffxvj7uP
         boq73TPkHMK+QZClBJn6hj8D2xjaE0B3eztRADzGjKv1cKFIr5fR38z6nWMmMCU57Bie
         uABpSNFD1ATTGAYr3IGtN7d2WakNQj0fGTbrt7tIcPay3JWQ9HCYX5N/6tfr5SI75LQA
         hfbXadF4m0fjaewOi9PzqonTzPY76it0vQRP8ococIDqMzPcr3BFyEXRnGJmX6pIhTYH
         26Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUNrx9kbSPTQRQvxe26IZvVu40WIMjlDMxWcOQUeOik=;
        b=iM0eDKoKGpoeRR8ev78+TsD8ntb16rvUvwWjgJukijsuSpeKpZLt3N1vnwdP+X3oQi
         FC6mc/QbliLkcRd24piJi7s6JNBYMReXoY64PqxnQHo/WFVkb3SM+9/Qh7Cpk2cYJa1M
         nbTvLNYXRektC8S0kM2RQCwenA7CSBtq2wtIDCJWKndwjfb711p9T7sYIIs3814onb5p
         6P/Q2vPYXzTrlWFalNDyZCaRx8XnWXsccvli0rowW/1zKp7aFNxr1R/er6kA+G7xJfAL
         LvMXyzPdaRmI7oA/hww6gUgtZApqKqtihH2V3qtaZIWY3Bx8jAasLBcXblN0giDF12Y+
         JITw==
X-Gm-Message-State: AOAM531Mqg3+13qICSXi3oafHjipWR61Di9sKrLuizFRwQdKiT2uDsSy
	mpnY7uaiuM9aOfgGg+kaLUg=
X-Google-Smtp-Source: ABdhPJxYODaISvA06/Ql9Wg54CI5/nOsy1sLBpyfQFlTelajEOeo33tx9RdLLks0QjOKVO2Nse2INQ==
X-Received: by 2002:a17:906:5501:: with SMTP id r1mr7246723ejp.212.1639859419617;
        Sat, 18 Dec 2021 12:30:19 -0800 (PST)
Received: from Snowflake.localdomain ([83.143.250.232])
        by smtp.gmail.com with ESMTPSA id i6sm1976582edx.46.2021.12.18.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 12:30:19 -0800 (PST)
From: Ismayil Mirzali <ismayilmirzeli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	simon.fodin@gmail.com,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] staging: rtl8712: Fix alignment checks with flipped condition
Date: Sat, 18 Dec 2021 22:28:47 +0200
Message-Id: <20211218202847.23086-1-ismayilmirzeli@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ngo Tak Fong <simon.fodin@gmail.com>

Fixed two CHECKs of Alignment should match open parenthesis and flipped
a condition to pull the code in one tab.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Ngo Tak Fong <simon.fodin@gmail.com>
Link: https://lore.kernel.org/r/20211207212223.GA70594@simon-desktop
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8712/rtl8712_efuse.c | 28 ++++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
index 4f3b54a7c3be..c9400e40a1d6 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.c
+++ b/drivers/staging/rtl8712/rtl8712_efuse.c
@@ -298,25 +298,23 @@ static u8 fix_header(struct _adapter *adapter, u8 header, u16 header_addr)
 			continue;
 		}
 		for (i = 0; i < PGPKG_MAX_WORDS; i++) {
-			if (BIT(i) & word_en) {
-				if (BIT(i) & pkt.word_en) {
-					if (efuse_one_byte_read(
-							adapter, addr,
+			if (!(BIT(i) & word_en))
+				continue;
+			if (BIT(i) & pkt.word_en) {
+				if (efuse_one_byte_read(adapter,
+							addr,
 							&value))
-						pkt.data[i * 2] = value;
-					else
-						return false;
-					if (efuse_one_byte_read(
-							adapter,
+					pkt.data[i * 2] = value;
+				else
+					return false;
+				if (efuse_one_byte_read(adapter,
 							addr + 1,
 							&value))
-						pkt.data[i * 2 + 1] =
-							value;
-					else
-						return false;
-				}
-				addr += 2;
+					pkt.data[i * 2 + 1] = value;
+				else
+					return false;
 			}
+			addr += 2;
 		}
 	}
 	if (addr != header_addr)
-- 
2.25.1

