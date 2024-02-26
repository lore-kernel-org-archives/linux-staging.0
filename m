Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA5481AD
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919967; cv=none; b=bTRhsRNW9PHBVgxI4Uj9h9rtefwAmQpdCzBU4OCcXrfLEeV53QEp1niq22GdEeuWoIXjQZ+wLPlPcUeZ8qQ0jyVRR5QbmvXZWcJ1hnTV3GjcBO5h84nMzNm96X7QtluRKzooLFyo80XRm8Bg6jJghKui9WpnF7L6AdqDeFButGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919967; c=relaxed/simple;
	bh=aL+J9YpPCTXZjblY7lvooQHdP2S0Wbtur0yP78NWTF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D9G+BJeFpCRKkMs2ITT1OAUlMT+6Atk3bdeq0NtViiKAjH6ikZ3z3vvgNBFZ87uB5rgsAQk6v8b6EmKaXU+Vau6HCrx9ldg/lVvlCVj9ofx6izc7uCZhUeaxR2NhkbkgTpBsRRTkhdXr6IALlbaDVGeu9oSzVyCr+DdQzvltGs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=J56elVgJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="J56elVgJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dc99a75be6so4202935ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919965; x=1709524765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiLiFMfWKCcVhhDB/j6NQ7MKUt9nWfWJUvYg2/4dEk0=;
        b=J56elVgJq3nV/Xko39ZedYi02bLhU2wm8ki5MDlFrFhOpRnf3EkjFF/ftKP3hXjRqW
         HmUg9F46ET7JbdbdjQ53Pm5sR6KghDsWHq5jr6gBNadysCENQR9SkO7szk1VDtjVaVHe
         T6DRgBJ4em5Xm5XUVw1ShuhEzjGIN+GY77d4r0wgD5ihABbWqJfkma+6IG7gqNnNT5sG
         27+k4px+KjmFngs7rhQDYtdG9c6ZP8YiVyeLgbTQAuITRYrbCOIYe6TNsCwWfoWCGl9n
         FFFkPakTGyHKLw4gN4tPrcKcLVWCYQw8HldvPDpnSl+3Kzk3Xy26dMtVjGcDfFqJXwSW
         yJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919965; x=1709524765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiLiFMfWKCcVhhDB/j6NQ7MKUt9nWfWJUvYg2/4dEk0=;
        b=jqMFWMldazzN1IYbigUmeevc3SORVGpre25D0c7QakrHX/PxwljGHc2pdLDvusVKVZ
         ujXdDU/Cy+XSTgwZbOY3EFNa7fgpduDMFYp+AyitMi0pP7hpp9GIjQG9mOqYEo533wi7
         13GX1Tt1aEP3p8oCahfqNjLa7FusEgw4AP5gV106gEbKm4YSg6Rr30gWBoIVpsYNZ1Qz
         TlAI+hsfonlAJVNhooovLNVJ7DJaSzOR+es2L2KEM5Q9ZasUhL9BvYrRb5y6YwnC3mtP
         9S95/Y1iThmt0apcl9L05lLrIeLbjhqheWiT6WTcMVc9WpK2JQzE7iKB50PSnDc6WSz2
         +T/Q==
X-Gm-Message-State: AOJu0Yx8O0UgSqm0Lmh2hfkGHs9YGs3WeuaCic059gJbNkWzqOmrnoVW
	hGfsDTQQUPsIkEt9ClrjTXGorw/NctCvITwHEffHgoONsmGH5S59gu9EuZFZkVU=
X-Google-Smtp-Source: AGHT+IGN3aK7O320K7eb8MOrqC1J7wETIlCGcBQj5npNjt6jSljmKpzLvD3ApAiqfFMyQJH6CruhYQ==
X-Received: by 2002:a17:902:e842:b0:1dc:78bc:ad0a with SMTP id t2-20020a170902e84200b001dc78bcad0amr7007029plg.36.1708919965391;
        Sun, 25 Feb 2024 19:59:25 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:25 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/8] Staging: rtl8192e: Rename goto OnADDBARsp_Reject
Date: Sun, 25 Feb 2024 19:59:13 -0800
Message-Id: <20240226035915.370478-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename goto OnADDBARsp_Reject -> on_add_ba_rsp_reject
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a3a2fe72d644..0581ed1e9ed1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -334,14 +334,14 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			    ieee->ht_info->current_ht_support,
 			    ieee->ht_info->current_ampdu_enable);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	ts->add_ba_req_in_progress = false;
@@ -358,7 +358,7 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
 			    __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	} else {
 		netdev_dbg(ieee->dev,
 			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
@@ -371,7 +371,7 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			ts->add_ba_req_delayed = true;
 			deactivate_ba_entry(ieee, admitted_ba);
 			reason_code = DELBA_REASON_END_BA;
-			goto OnADDBARsp_Reject;
+			goto on_add_ba_rsp_reject;
 		}
 
 		admitted_ba->dialog_token = *dialog_token;
@@ -384,12 +384,12 @@ int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		ts->add_ba_req_delayed = true;
 		ts->disable_add_ba = true;
 		reason_code = DELBA_REASON_END_BA;
-		goto OnADDBARsp_Reject;
+		goto on_add_ba_rsp_reject;
 	}
 
 	return 0;
 
-OnADDBARsp_Reject:
+on_add_ba_rsp_reject:
 	{
 		struct ba_record BA;
 
-- 
2.39.2

