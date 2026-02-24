Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9A36B052
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929290; cv=none; b=Ob6YZG/Ok03NMZkKKV/p/UuXfZF1tlyopDzucK34qm+FQeMowauy48hyBLwvUlmajLbNjJHDw83Wtu21Q26cKOEdpLx60FPIxfzfka6US0qC4mZi0rzp+sW97CGcunh52KkTRiaIIS3kWTbtBu5YPPRkE1T+s6YOK0IvjY5/qcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929290; c=relaxed/simple;
	bh=90UTwdo9gq/wJczGzEpPNKBvGpW/7c8xKxl+nV/M82w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyDIYMeZlYTwhNIx1YovAPtAZTSZCENTjyZh4SJo4UV7ZLTIVY6iPBHXbke6H0F4+jVJueavcNInhvEMoe5JQD/7O9w4WWUVhNZ6YCflna2oGrfCaa/iPyq74+QQez70VrcWqlX4ZOYP8s4AAauq3VUZ885y0d6VORwW/Kr1VLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1E8NpU3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1E8NpU3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43637371266so292261f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 02:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929288; x=1772534088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js3U4HzybY0dFqzHfP96w0bp1b7yEjH60AZmjZmn5bk=;
        b=P1E8NpU3OBNkAX0AfIKsl769BAQf+I8guBBgm1rzFv5vQsK+UEqZLu/YcpHQ6oLJsk
         CFbPrSh9w3iNmI/lCcJyyK/8n9ALic9kXP6sp4ODumV8PjOn3paK/Rktq0sv91fqK98D
         RkB87ee6OwBxgwZ+3S4gMFELZn97/e9GNg6Nf3ZJI5e6vgA6eeI9kXV35MmOnq8fqgvR
         Ntk9YlVTbpxhkSHJ+EH50oRW9IKhhtlGf50+9+oYsVdMN8PURh2pKLBs8exKiE6T/hCx
         yggqMuqVTCoAXmjls+vGEBUCtCPThPKj6mZRPjrbgrSjhQfr7+1E31xTEpu/E5UtV/7/
         crwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929288; x=1772534088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js3U4HzybY0dFqzHfP96w0bp1b7yEjH60AZmjZmn5bk=;
        b=Yhkl86x4fsXxkeh+ddNPB1adsnAjY7vQ8Hm70PFJg+P0lH3WiMEayn0dIyrl6NJaQG
         kZWHJHKgd4PcBEi2pEqGHzmjkO+5jzzIMEZ5xlI33FnIBm3YiILQMEkmy2qqnh3/N0Ej
         foEnkffnhudWK6OB2IwO6HiYbnPWwNy0Yf+BbkN1gY7VotAV1t/3zIutD4Lu0dgZLUJ7
         /aYh7IRZm6ZPZOCEA3pRmiYRPfO5u57eGkWDHP7fuhYZIXeGmF8SQv9/7GSXDT9dANIN
         D1yq2oojMWXg6drqdRMAILrG2ffUNVpbS+CSulLESHm1MVI9OHs0YCrbSku0fDDXrup9
         ewPA==
X-Gm-Message-State: AOJu0YyB3859ALOXTN/KB0EklCAT+hbRfJmrIIFFetI0TV5DvdLvs7Oi
	xLM9oIp0T04vL/iPkFGsE+MwJYN4254XRNlIfSEjOfx4oIfyUbg6W5Xl
X-Gm-Gg: AZuq6aJ5/OcaBCiZSqpZWXGEwo/puVem4pHWDBKHw9v1LstAoxYUZJ6zTxgtvcQmgda
	DbUhR3VRE/Z5+0VfEv1PEHmMqgvqFVT4DvEvSHazvXI4bN5kMuBFNeuv1TDdcWWOVchsoGITnlV
	sBkCa1TLFq9dtaIF5LByw8JlC5XPKdKy/bSqRvL+BNh5k1MJ2m5oEfEmqxIry+I9epMWUD8l7T1
	VsKx4Or9O14OhT83uTGOnCLEf6yNCGOuIjbxz+ERqqjjuIzO1F3iZSP57QZbYlme0cFeu/Jcwpv
	Ks5uFUcsm31atnUhgxLrRmhMOAXDeznGcupn7coWyqDqqRZgbHnnacCCcKLyjSmBS4BKZS9IUCR
	B6RF2dDXXRU90Bd8CkaSJQq5kdh6aP6B+80ti5k68YZuViaY4/B8E5zeW7CRgwehnAZthlkDBHS
	oTuH9mWPAdzcmw1fzysdU1cl1heCuPb+9XJXEgDM/I7Y4PMc7j4T1Rnv7/6zu9nScepMNXDE2NT
	7iTy72/bxJeXKA9eAYNqcCkc46IZNhb4tzBZOObn72HbK6fFU/dRgiQNIKFdKE=
X-Received: by 2002:a05:600c:8b12:b0:483:8f10:4bc5 with SMTP id 5b1f17b1804b1-483a962e47bmr104557575e9.4.1771929287682;
        Tue, 24 Feb 2026 02:34:47 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm500687595e9.1.2026.02.24.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:34:47 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v3 3/3] staging: rtl8723bs: Fix "adpative" typo in rtw_xmit.h
Date: Tue, 24 Feb 2026 14:34:13 +0400
Message-ID: <20260224103413.48216-3-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "adpative" to "adaptive"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v3: resend as series with unique subject lines (Greg)

 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 544468f57692..67a5d5f78a1d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -157,7 +157,7 @@ struct pkt_attrib {
 	u8 key_idx;
 	u8 qos_en;
 	u8 ht_en;
-	u8 raid;/* rate adpative id */
+	u8 raid;/* rate adaptive id */
 	u8 bwmode;
 	u8 ch_offset;/* PRIME_CHNL_OFFSET */
 	u8 sgi;/* short GI */
-- 
2.52.0

