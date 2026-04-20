Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27093254B3
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659260; cv=none; b=tlvj8WvG1x+bcJ02EovbCITDiF8l28X6LMgDbmV64jYlCXRdaIJY1hoi3PV2XjhmmSNQoO1/1ZzOx4/S0ih9H3YQzf8mw7NApvMTYbeNLzrv12PvXHerLWkGXxLSDp4hIvq9oxq6oJx9WyZ5f/OL++O+483rvae00J06I/DLAl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659260; c=relaxed/simple;
	bh=UXuC3HT4ZRVzNuH/eMOOnxvBOw6om5rKv8yIGlsCNzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFF/jYuu/7mra6RTErYe/pbesLIxGnHe8VsktEMVd9E7lppPty5sITJ5F1RJcc9rH/Fp8wx2aiJy+nKt753lKWN/7LdgE7HMRzvHSjqebfZehpghteUe4lgtufX8lzkNq0UaLquUyVOQrBQPnbLxOO/uzf/MT6QczcYHj1ANEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJut3EjO; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJut3EjO"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a3342d301aso28288596d6.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776659258; x=1777264058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwJCgiVgC1aHzj9fgm9AjJI13G+o5uSok2wZI6YyOf8=;
        b=rJut3EjOyEwF1zVJ6QxEcFKdIhj65AvI1SwQ+y32uM1QncX4Hapx8Di+L5CA4pDEXf
         LvalP0OyIX6vDoccY134HggQs7nBGo6NNCq0kWpN/MG6O328xjEfaSOr/fcqpI5HT2VF
         3u79GdFpuUPXwcFi+LaNPs8FJ9jfS3ErjXUVaMDUUGdNyji+rGT9MlY77sT8h+kjcdLN
         JtSCw4HL9Ryfl7wTjlUi+WV3Au4q1CcEhWumUJGsQsiQWsr1CQt5G0VqrJELS12jCzjr
         PzhR28tWRic2vZhlqch7emm3a8SyUV7JvUNkjCLn1V/sLzZ753NPEkNolz5i79j85rDg
         9dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776659258; x=1777264058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwJCgiVgC1aHzj9fgm9AjJI13G+o5uSok2wZI6YyOf8=;
        b=Izwfg+7QrcUHqpzuYBUZ3/ZhvE2S/QKOknEm63uNX58xD3yfCL5rtvSUDjp0hQpySq
         Ric6rthmlb9mVpfJ6oI2jLkJ4cu7Qf7s43J0/FgTEmrKDLr/zaIwMeydK5a78RhjBYyt
         jqEj+7jtQPogCdi9Ve6qDzqQU/pmZlavq+kDhUUUEJNO+zGMO7iU5ErEtu6X7vN2ZjiF
         bGHrnszuJPCaU6XkII/TH1qurQ6talthMhtjMMT4eMVQMrGGNLc5Qr/Mgp0ZNhJRZAkt
         hsv3sdskzT/5HetLyJCz8Zxrs/HIZMiDi05a+v+pTFm4l77AlMy0DTcZHvfeWyOnmzKM
         s7sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lSjOpZYX3lvtmvHIR63QVxI9HThgaoBGj149Lw1Za57LeOzOdUUoHqG6XbY0VdkqESLVFOIvDJbvMRK4O@lists.linux.dev
X-Gm-Message-State: AOJu0YwWyHi7IcuuNpbX1mkBOR4Zc4h3xQ2aZiHeeeJwgovkuXLuo9YX
	IR1crlZQnSiK7WqNznHcX2nk9foeclqHqU+vCK1Spo4X+owDzkzX0vEb
X-Gm-Gg: AeBDievlPO8dRzw0BixfxqCIX7webh/qJwtb6aBAiQtdAYIJSZouMtwXkiwTyGQk5zI
	Zw6ZaNgev4skhWVgZN040hYPMh2bArdeqKd+63VSSrqL+psLIeYAC+sufyRr3v+q10j+umcVut9
	wEfjHrlo2pSOzGv7k7wIpoTUfBaHT11JaXh9ZtHV5TrRb/arqhGo/V7K9JXqMfxQh08vHp7vksD
	iOCe4ZyjvnBbzCcrigh9N9MU2/Er6x8P31Y3fioQzZ/dmULWE2PpeOQAiUHvlP+RMNxKWvfSB1V
	qPLCiQpFuxG4XNKpZikbW5CycQZ6TWaubsg+Iz6EMpZMvD3AxwTEyVP3gMaQ903dmRcdN+a3vtI
	cEctOOSofk8/UyttP6RZzVyv8K4juy3StqqfDoBnJWNG6sQt6CwWM3Bn9vBcgKr0WEfJ5Z08VZJ
	asTrMniZHelMAZ/fnjEaqr5n1HRZvRxhIWF+hr8Xhkdbt7dRC7mZN1sYIksY8=
X-Received: by 2002:a05:6214:1c0b:b0:8b0:2b9e:963b with SMTP id 6a1803df08f44-8b02b9e9dcamr192145566d6.12.1776659257806;
        Sun, 19 Apr 2026 21:27:37 -0700 (PDT)
Received: from localhost.localdomain ([165.85.38.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429e9sm67598516d6.3.2026.04.19.21.27.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Apr 2026 21:27:37 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>,
	Taegyu Kim <tmk5904@psu.edu>,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: fix stale recv_frame free in recv_func_posthandle()
Date: Mon, 20 Apr 2026 00:27:34 -0400
Message-ID: <20260420042734.3685-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recv_func_posthandle() saved the original recv_frame pointer before
calling recvframe_chk_defrag().

On the last-fragment reassembly path, recvframe_chk_defrag() may return
the first fragment as the new frame while freeing the original
last-fragment frame when draining the defrag queue.

If process_recv_indicatepkts() then fails, recv_func_posthandle() frees
the saved pre-defrag pointer again, which can result in a stale pointer
free.

Free the current recv_frame on the failure path instead of the saved
pre-defrag pointer.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f0..a404b6fc97723 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2139,7 +2139,6 @@ static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rfram
 static int recv_func_posthandle(struct adapter *padapter, union recv_frame *prframe)
 {
 	int ret = _SUCCESS;
-	union recv_frame *orig_prframe = prframe;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *pfree_recv_queue = &padapter->recvpriv.free_recv_queue;
 
@@ -2163,7 +2162,7 @@ static int recv_func_posthandle(struct adapter *padapter, union recv_frame *prfr
 
 	ret = process_recv_indicatepkts(padapter, prframe);
 	if (ret != _SUCCESS) {
-		rtw_free_recvframe(orig_prframe, pfree_recv_queue);/* free this recv_frame */
+		rtw_free_recvframe(prframe, pfree_recv_queue);/* free this recv_frame */
 		goto _recv_data_drop;
 	}
 
-- 
2.50.1 (Apple Git-155)

