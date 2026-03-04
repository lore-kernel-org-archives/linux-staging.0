Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2627FD76
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629631; cv=none; b=jPODRWlaN1XzPwJq5YgKZzHalOmenXOwn/BElL/qNYg9iQhHHWJtLz9vVgvdMPdCy+OPRRg0jtibh4G5IXvJNvdfY3ZzBZfr07nP90N8+TNGiACob9T9XaUk4x0RlQ0/zqUe4EsxRkVBEcF4TgiaRpXuDBC1cXw4D/BJVlON9E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629631; c=relaxed/simple;
	bh=MqxiYFGwzTMESaE62XviNKbyKIiIYBkQUwx+PkEpzOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkiAkptqxhB0YkRWN+cJEYehSzliueeRR+W8LRw7Kp7KW7y1njBvJKqs6YS1fnYxS/yMtb5WUQPoRqrMX87u6r4JvwoidrEoDlf/hwl4N+EP/u9YswnXAHsTPb+bA8g68oR4sIZlWmaVg/WTSjSE4VTnF/jUyHrZxkNAKMtPxL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnhT2EeR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnhT2EeR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9359c0ec47so736905466b.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772629629; x=1773234429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9wLFLtjd33UF2ghzvL9QXkwuDQG56xOFCNldKGvwxY=;
        b=VnhT2EeRru/pfNyfC7W/h3Cqg6N5hyrJD7lytk0ZnCKlj6x2YU5mia1WaSpzVPBfb3
         I89k3kDuuobBpVAjZzO3GgC7hkKAHZBgplQ3qwtYDXQU60ktbOVv0/HlGkPP7T1iyZRe
         qYSlqxxwA368BEpjG6I2msCGjut+X6Lvu5cX8/qZH3U2qhuorELmvmk1txpGWfL3Tati
         FY8/Ylu79sUAjpyQqyRMuQgy4LCfIukCfJ/uD9van2wlXF0c0mVlgIaj2gLuVCAkgkoU
         gN4AcwSedcJAlPDTUYcuvfXkFLemS50brZKRBhxxcDmyU2k8CoCm0KEtV3Y8NlBmwLyK
         dJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629629; x=1773234429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9wLFLtjd33UF2ghzvL9QXkwuDQG56xOFCNldKGvwxY=;
        b=LPAg7qCul96fdW6LpWHWWDbsxdy2yn3ZMlOSM9zvDZWlJUPI3JFmvC/6elMNW03bKE
         EuqvOr6rtp2A5lw9iM+kdie6B1N5CQCACiJ2gMK8UrV1/L5JTegHYDr3pYU/rPaXS98W
         3zgOz4mdN0eSGOVci4+56Y7MKeMhxI0w75lAG9JpCKnMykROib27YSAOs22PeEF3NmWm
         br7YdqNGuNshqg1g+XhKoo/ByTEv+wLSTXwkCRydnNN2vWzz/OG2d4H9hpvF6G2Fq7B2
         YVwC7MQn0hpvK39A4PpmIFP3tgBMbPgabQo6YEBAvdqdm95BJ7BJHzYQ1w5TJ8FWQSno
         Vi+w==
X-Gm-Message-State: AOJu0YwcxlxFdcHhwviRBZikt9R8aWUI2LF33XdJuoFvN4eGmKYohRIh
	A99Pn0j0k0zZtWTLthdxCjbGDE3s51s54Ok8ar+bimsDURknlBfCVJPYMzBMAYUVn3XExA==
X-Gm-Gg: ATEYQzzkLVb13Yy6FNZTVLCr+psgKTwoNWDJjmbunDJquXj9GmsA99ABIzeuN2Y4uM3
	dGqL/OvDg78rBAPJ6cC/kgu8kUwVcFx4jwkoeehJQSkdEW6PPySkt7LeDZLUAL+BP0j/xBcMPkr
	TMXXULMsSyeSaWfDVqK4pHu2LRt6/Qi3ysjO5Ow25RiuUR+8oGIvkaEAEnjGkctNQFyTPPxqnEr
	Rv/FsoXMHn5EMBeZyyk2JOVGLLSDOrh4pVfxUNrTYq1bFq3qs68kWD/r+VMlxXCzkuMF9Xn7Ppe
	/M3uqdP1oKRPnzqO0hd7elh1HmIv5+xblK9PUU64gqmaFN9mAAvG4IUR7Oq5SwW9rBiGcMD6diz
	7k/2573a+pYNF4AxWSe2a7T5qBx4MCcQ7IcE7ZBVY6d3UfKLJ0b2swHtQ9BJs8Rv6KltD297yrC
	Kra7XwDMUnbw3WNkg/QKHLbnBGXBxgUShlfTCaUmPoqIRHj9KzGbuS1zp0T+zyFdq65kQ57usXQ
	yrvmRvOv/F6l4mM876hoJN4JdfQY0w+UoEkkAs+KOozeZmlrZnOtg0jUJefeEPWjyvmLDuKKom+
	Qjl2U6CfXbQXVk8T
X-Received: by 2002:a17:907:1c19:b0:b8f:a32d:b90c with SMTP id a640c23a62f3a-b93f138780emr109255866b.38.1772629628525;
        Wed, 04 Mar 2026 05:07:08 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm734532066b.53.2026.03.04.05.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:08 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace kzalloc/kmalloc+memcpy with kmemdup
Date: Wed,  4 Mar 2026 14:07:06 +0100
Message-ID: <20260304130706.37347-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 .../devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml          | 2 --
 drivers/staging/rtl8723bs/hal/sdio_ops.c                      | 4 +---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c             | 4 +---
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
index 6d1cd651e..a21cae6e6 100644
--- a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -31,7 +31,6 @@ properties:
     items:
       - const: interrupt
 
-  interrupt-parent: true
 
   xlnx,use-rx-data:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -56,7 +55,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - interrupt-parent
   - xlnx,use-rx-data
   - xlnx,use-tx-data
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61..514c857a9 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,12 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
-
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
 	kfree(tmpbuf);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..2125606f7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
-- 
2.43.0

