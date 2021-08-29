Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBE3FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 23:45:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g18so12373294wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZVXToEeLg0M09BUE8KQM9xZTB6xeGgMlFFRYEbET7Tk=;
        b=Ca0L4/TSNSSUyTBGE9U79sUsrlSRD7qc2fRALCbUBoKGKzUA7a1aL3nwFgLZ174Mnq
         VnoCzlZz/O0sA0J8s4L4wBWxLyKwBKkHPMm1V2mZF4ykLQAvuxjMM292ROpyYRSIHZ0G
         MbMtnICT5eA+gnZ3/YGBRJq9Ka3GOMR02F0SDIuC4LshGIfUZyp/WZPLypleocKfCKu9
         ekUQqwR/kqA2xFI+7Ds8VqpTCIEhVUv74id+YKKEtrF1mNqAm5IDi1xIqK8fnvQJylY/
         RWRfYylTC98paDEq03nBggb1DeP43VZKJftza/L2MGHtiOXRmDFRsVwWjShbzvlNnR0b
         qbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZVXToEeLg0M09BUE8KQM9xZTB6xeGgMlFFRYEbET7Tk=;
        b=FOzma8FfRCopZGiOqaxZ8QQr3OU775pf2rNTYobvvBpySviDcGUw1TZQ6EnBoswpHs
         ERaukDxfbCmh88QbdL1QA0wrO5olzA9hkBXjptYs9aSjPFJVaQgCnaTWqzLB1fQMDC4b
         XIz2eAwmPZKW7wMwI43Rc7Tlp13JRqgFnqK6DN2ZhVRtuJbxV6jFKJLiwNZCqH6TEpTP
         zDS1wHAsXkDYMz7fTnsgJSyueKWiKe1G6iTNA9XZbjVv/UHBic+q1jIJYSvYFWVO0xNX
         iqI3t4nioMlU/x3v8ZtqQ98y+Mklfxo+sCTb/8dQyvJ5F7/GrNc1ZpYnAKx6E8P7xWSy
         lWUA==
X-Gm-Message-State: AOAM531pBzTT/6A1efic1aZfeMmR5i0I+dxezK+ghStapucJO/Tbut6H
	4CtFvf+ezRLFlQw5lC9M/VVGUQ==
X-Google-Smtp-Source: ABdhPJzAf9SIwHMYjZ+Z6+rIKxlq/yy2TnqnK8btZumGAdtbQNuoJscNaJZ1eyb/q4l5klgYBgGkbw==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr22755166wrh.356.1630280745355;
        Sun, 29 Aug 2021 16:45:45 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm14500574wra.12.2021.08.29.16.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 16:45:44 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: r8188eu: simplify c2h_evt_hdl function
Date: Mon, 30 Aug 2021 00:45:40 +0100
Message-Id: <20210829234541.946-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210829234541.946-1-phil@philpotter.co.uk>
References: <20210829234541.946-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify c2h_evt_hdl function by removing majority of its code. The
function always returned _FAIL anyway, due to the wrapper function it
calls always returning _FAIL, and its one caller doesn't use the return
value, so this function should just have a return type of void.

Leave the call to c2h_evt_read in place, as without it, event handling
semantics of the driver would be changed, despite nothing actually being
done with the event.

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Acked-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---

V2: Changed return type to void, based on comment by Pavel Skripkin.

---
 drivers/staging/r8188eu/core/rtw_cmd.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ce73ac7cf973..14b74f92cd0f 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1852,29 +1852,12 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	return res;
 }
 
-static s32 c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
+static void c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
 {
-	s32 ret = _FAIL;
 	u8 buf[16];
 
-	if (!c2h_evt) {
-		/* No c2h event in cmd_obj, read c2h event before handling*/
-		if (c2h_evt_read(adapter, buf) == _SUCCESS) {
-			c2h_evt = (struct c2h_evt_hdr *)buf;
-
-			if (filter && !filter(c2h_evt->id))
-				goto exit;
-
-			ret = rtw_hal_c2h_handler(adapter, c2h_evt);
-		}
-	} else {
-		if (filter && !filter(c2h_evt->id))
-			goto exit;
-
-		ret = rtw_hal_c2h_handler(adapter, c2h_evt);
-	}
-exit:
-	return ret;
+	if (!c2h_evt)
+		c2h_evt_read(adapter, buf);
 }
 
 static void c2h_wk_callback(struct work_struct *work)
-- 
2.31.1

