Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032E33937F
	for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933975; cv=none; b=U41XGV9OVrVPr3otJ5n3vjfr9cNecelxVQzYP402rsGxqPb+0hg7bOMbWw2HOXkoKseRgPxEBbMC16XYO2V9GdIBNCtyDps5um/bIImJLkxsPVkJRrae5i4urWK7YMMNESW09769YbM8G0rWvmP7Ja7/603MkMq1OD4m820Fzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933975; c=relaxed/simple;
	bh=wqq83oAhvjQiXwMTzkrFh5nQ60NmybCgvOLWg0dQPNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4Um3DiYyF5tqTWS8nCwNqIBTG7SPKRvYTdhY085/rJpV44dn18yDywCXAIqhJC031f+nn9Yng4pq6AIsQtDLwqvD7tXrpd1q9xofrcyaLQqyj95CyJO94XX3UHvldLOuYhvVAEbAlOs2VqO5XuHn6oY+spCOCBSIxlc3vRgIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=badchecksum.net; spf=none smtp.mailfrom=badchecksum.net; dkim=pass (2048-bit key) header.d=badchecksum-net.20251104.gappssmtp.com header.i=@badchecksum-net.20251104.gappssmtp.com header.b=gOLl5SII; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=badchecksum.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=badchecksum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=badchecksum-net.20251104.gappssmtp.com header.i=@badchecksum-net.20251104.gappssmtp.com header.b="gOLl5SII"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1361214f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=badchecksum-net.20251104.gappssmtp.com; s=20251104; t=1789933972; x=1790538772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfW935QN83eOIgkIZEIjJShEsBOt/4w+m3tLSa50Hc=;
        b=gOLl5SIIUNaC0e5UCuxf851FRIq72QOGsZ9Eoxvbbs8/RubO5rwiK4tjcKGfEERClV
         3kR7qWRY++yPgf26zlUBu6h3x0HpOZ9BvAK3jBehSwAh719xeXPzE6k4EbMHMm6U54gO
         kBHWv1cBd9FVYzjqrgLQNk3yJm6wJHvzuL/bZym1fMW0Sdnn21A2Q80VFXzFczPxz7Ha
         pA78xuhj/nNc7v/XP1XcE4VpqFkC2/VHomKoR0IcTB0m2hkpjaTICe9o2f+DPXoqcNmj
         9Ln7+iWFDoX6EYA8PG7xE9IVvzt9Vq9GpmBuwx+ROcN6BDJdIqisF59KVJ1jrX/8AFpq
         8VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933972; x=1790538772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBfW935QN83eOIgkIZEIjJShEsBOt/4w+m3tLSa50Hc=;
        b=YegT8Q6KRpr5CwLtCRycx3Kx171q+T5QN2IoWW1WQiIiDCyDzFAP5peLylT440b8BX
         u8jKMQBoC+KzBXxQPiEnATjb3f8CQk/IffkZ7k8Zviw9T/nfxcGIstAomGm0QwPr85Dt
         DJ629x7I6b5FIBEMgiz5dgulns/B4A78kaLn3VVZZH7V4tQJttLc/l1u0osmgGaOOqOZ
         VfyacUoXIJZsr3LScs9UED8rTxIwYpDpKpwY+4i6przGgOghWuU13eep656cAGlW4Pro
         +YDgqvjsCwXedl4fGv8lRQK5JLYz9DpCZq2wdu4rm87lVui9L5FqBjRrPLGgUJAIXduC
         k/nQ==
X-Gm-Message-State: AFuF++noKwWM1zRi2QQlamOPQu6SChi36/6bp3TKFn+PPTIzJ1wscMs6
	v/V+gEk0/BUlR8LXBC+5FX4pWu84bw6eAXem2WARhjSr3SLheWEpzNnwM7cZZhsUbA==
X-Gm-Gg: AYBFou0O8xNkQQjLgQoRe2LI3KQ7Ts+Oii0+DvR1Wxcp6TJLtPmTwKHG4CfcFsQlM1e
	5zK8G/RBdNW/fQdV0dcrzwrc/hYTrxnADtlkblT347tj2maWRF6AkI/N6JYlDw0kZMjaIos3L+P
	/Ln9Zv45k9g0vxYPQ8hgz1JWX5KEvTrnQpK5WCchv1sKMxJ1NWDJnCm4KcuVDRqSZT2F7nDQjcc
	MT+tgFrcsVhT775RDNdAwPbS0nlAdbgj0eHBdMTkXlHodJzpYe9I1R6lY1SpOJCXFFa5/cTkvGO
	cqx/31xVOQVYPXURH1sHsSE71hzyo++e6ySNCS7o8WfSGmSlOGq12EesY1jvRP6vdxMO77/DvLk
	3nuTQOGW+YSH7AaWP7fbe7R8wP3ig45adhF5pmAUaGXyT8c/TDCT9wPs3ftYm0QxdmUOCargu9V
	bOs01lQ343+pY27wKw5FVRUhsXw460fPfb2sQglwevu85cxlTJaxSfp2iAQAXjVqL1QerxAEqrt
	aDeSKeY1dxcbMnwJbx+9ggS4ndAYCqBnU3yRw==
X-Received: by 2002:a05:6000:4b05:b0:487:27f6:a4d1 with SMTP id ffacd0b85a97d-48727f6a636mr8622973f8f.33.1789933972036;
        Sun, 20 Sep 2026 12:52:52 -0700 (PDT)
Received: from h4x0rl4nd (78.red-83-43-188.dynamicip.rima-tde.net. [83.43.188.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459a5d2sm15186046f8f.31.2026.09.20.12.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:52:51 -0700 (PDT)
From: Jesus Olmos <sha0@badchecksum.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix stack overflow in rtw_get_wps_attr_content
Date: Sun, 20 Sep 2026 21:49:48 +0200
Message-ID: <20260920194948.214750-1-sha0@badchecksum.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901091226.444666-1-sha0@badchecksum.net>
References: <20260901091226.444666-1-sha0@badchecksum.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Hardware test as requested.
Tested on a RTL8812AU USB adapter using the aircrack-ng out-of-tree
driver [1], which shares the same Realtek vendor code and vulnerable
call path as the in-tree rtl8723bs.

A crafted beacon with WPS Selected Registrar data_len=200 triggers
stack-protector during scan:

[ 2066.558409] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: _rtw_cfg80211_surveydone_event_callback+0x257/0x260 [88XXau]
[ 2066.560453] CPU: 5 PID: 8151 Comm: RTW_CMD_THREAD Tainted: P    OE    6.1.0-39-amd64 #1  Debian 6.1.148-1
[ 2066.562495] Hardware name: Dell Inc. Precision 7510/02H5GH, BIOS 1.22.5 05/26/2021
[ 2066.564135] Call Trace:
[ 2066.564853]  <TASK>
[ 2066.565569]  dump_stack_lvl+0x44/0x5c
[ 2066.566296]  panic+0x118/0x2f4
[ 2066.567020]  ? _rtw_cfg80211_surveydone_event_callback+0x257/0x260 [88XXau]
[ 2066.567817]  __stack_chk_fail+0x10/0x10
[ 2066.568542]  _rtw_cfg80211_surveydone_event_callback+0x257/0x260 [88XXau]
[ 2066.569336]  ? mlme_evt_hdl+0x63/0x80 [88XXau]
[ 2066.570107]  ? rtw_cmd_thread+0x23a/0x510 [88XXau]
[ 2066.570865]  ? set_tx_beacon_cmd+0xd0/0xd0 [88XXau]
[ 2066.571635]  ? rtw_stop_cmd_thread+0x50/0x50 [88XXau]
[ 2066.572403]  ? kthread+0xd7/0x100
[ 2066.573139]  ? kthread_complete_and_exit+0x20/0x20
[ 2066.573867]  ? ret_from_fork+0x1f/0x30
[ 2066.574570]  </TASK>
[ 2067.487113] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: _rtw_cfg80211_surveydone_event_callback+0x257/0x260 [88XXau] ]---

Sourcing rtl8723bs SDIO hardware for a direct in-tree test.

[1] https://github.com/aircrack-ng/rtl8812au

Jesus Olmos <sha0@badchecksum.net>
