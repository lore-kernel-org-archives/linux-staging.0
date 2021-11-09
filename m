Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2D2C8B
	for <linux-staging@lists.linux.dev>; Tue,  9 Nov 2021 11:53:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id g184so18264502pgc.6
        for <linux-staging@lists.linux.dev>; Tue, 09 Nov 2021 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+P7Fs7OEF//AkCFwWHTn/bNUnCkRRYKmolIIpUkc3Hw=;
        b=MQYMqOPt8gRKNDkKXAxet4zXLNDLlUMs0Kjm8ACi6RfUkVpVLpR4hR/vmjRtt2PuDd
         avDje7y1NJsnj1lW/9m3ZImVVXkvcXdvgGAa374EuBB59PRuFUXyAOPCajC9f9MVDiyK
         dfTvwT73OvBE4ioQ6O/dMvKuiOKBr559617C3qxNIjVxOr7iqPBP8O5Jc2VimHQzyJT/
         eTlU3FAMhDUvJ1M5qfCafrAuxzsYIIlUWi0mvrt1PFQGzjLy+buXa1u4jGmJ6i8cQOAB
         UijjIkZoeItyAxRLHcEcsXsAvvLFFIgaLb2J29Ey5tI9jrg5yHsjNglfdbPDAY0y4kRM
         TF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+P7Fs7OEF//AkCFwWHTn/bNUnCkRRYKmolIIpUkc3Hw=;
        b=Cyj71E4GlYgKZkZo39d4qYheSnYj/U1CeWU7/PmgkW7cB5OSG3kdsChyr4uO9GAvlN
         gt6szEwpbRC5OY/Yd0mcHxssTNv38a4NPYmHasLu6ZA5p8kAuDYx2JHcuAjvNXEJKRJc
         obh6mR4/H7JNhBwzLecW+WCu/2j6C7ikqdgNUVNyNBaYOrXfDuWDunnplulz5nbavH+9
         v6ePHSa+p64DmhlyyPHtIKQzf/Zq/t75SyT79kFS4b55KcIGGxpfDLeHH/YL9SYqRKdQ
         ScqRjO2axboMr24KRMmncFETtsYUI+XZKH4I1MzkXvO83QFocQAKqPTqLbhzAC37bC7K
         eiCg==
X-Gm-Message-State: AOAM533RlDoM24ZvsHATvbFmJW+tw8cilyg1FlnS4pC2SpTgkYBBhElm
	68coT+z6wC2Y4de6X6UPF0Y=
X-Google-Smtp-Source: ABdhPJxjsPQJeT+gty2oz6smIguBfdTWna00RmH2Ph4MbditbT6Y2UjbKd7HzhaXx8fP65GuP/oGJg==
X-Received: by 2002:a05:6a00:24cd:b0:49f:bf3f:c42c with SMTP id d13-20020a056a0024cd00b0049fbf3fc42cmr7465341pfv.54.1636458793900;
        Tue, 09 Nov 2021 03:53:13 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h3sm2420878pjz.43.2021.11.09.03.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:53:13 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: r8188eu: remove unneeded variable
Date: Tue,  9 Nov 2021 11:53:07 +0000
Message-Id: <20211109115307.133100-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck review:
./drivers/staging/r8188eu/core/rtw_cmd.c: 66: 5-8: Unneeded variable

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..1b1c47f4a34e 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -62,8 +62,6 @@ static void c2h_wk_callback(struct work_struct *work);
 
 static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
-	int res = _SUCCESS;
-
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 	atomic_set(&pevtpriv->event_seq, 0);
 	pevtpriv->evt_done_cnt = 0;
@@ -72,7 +70,7 @@ static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	pevtpriv->c2h_wk_alive = false;
 	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 
-	return res;
+	return _SUCCESS;
 }
 
 void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
-- 
2.25.1

