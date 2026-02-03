Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A13D1CC9
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135586; cv=pass; b=TNg/2ItMhD+1r6kBofq2932VAamS9xpyLfpYhpjcO5W4TK/vib+t6oClCsOlVps8a+flt86VnnZ4sI7Lhgz3YilE9xTNzesNVI7/aaFPRJyhfztD2C4zuFoJ8IsF0UlyQySxjKA6Ull2EpuWvGVpOd5Y+E2jdrSmBSet8lRxZwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135586; c=relaxed/simple;
	bh=7Sq6egjiLvpcfgE/9tSCB5BicegS8vuOuOuLM777kK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tK8hqvXViR6rprZUJx78tg/gCY4I5tW9meaMxtsGiRpcaD8sllQCV9Wqx2CiMH5zGUS7IuPOxgMp0y6C6OMyI+fgWKFoBSF9ExIvpWa+hiu0PwaqHOApIZizXKbX9cpYdLN3GTqmh/zZmmTKK89HgPv4VKo+oB8YiAbpE5MuDV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6nvpPun; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6nvpPun"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c715116dbso4051142b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135584; cv=none;
        d=google.com; s=arc-20240605;
        b=fKRWrMyr6P1Czoy1TTh1IWVSsH0ddaIJTviVCsnTlX0p8P2FsTvc6GMrzUa0N4k+kd
         RYJhEaQ9y0hn0Q1JL4UgHbgIJZhkjAMBBMAnNye3Kc9tXf1jr9jxpHHybrvsjLT4M7hn
         VykogW5qIbdSf17rW7ZmTZhezT7OTpEFyVsrWaAxe0UR13SHyXglZbBoIr83wPaGhuFB
         M3L9imMhZ4YW2UHDTlwOVpi5DqEcVecT3iqI8LRW8WQQ9Uv+to65YqOyFoaaUvV+MIfr
         4kJMcumqEcljBRDPs2QjK4Z0v4kyrE7JQ4PJf72yQ/lqOgqk8CtzkqWblRFJ50UdsNIe
         yRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        fh=Xj7V9kfOgDH1SHIgI1GZWe/M6NfzhXczPvi+B+mwFMQ=;
        b=gPF3AVtLMXPNechacTBjiPQsET8ermphZehiLpTOhtbrcu+EcqiSmQ9YE1Gaat5KPI
         F+9Nh47qIb0l8WBIocKxyoCH1/hggGb/mGcW7RHSJ9Kao+kK2K544jCXADd3/kS+B12p
         qoB8D0FyvKFAe6jjFC6s6OTxCG2BdM1bANtYS54jl6wAsEzMo7VEfg3bPz5gS/3VGs6S
         ts2vAEMeJ+GP8hXButgbvurYYeMFys1VTTCaLV3XoQDbUc3HwJ5USL/GBSCVkxIgSlr0
         COOieRGtsZWmryVdCzMT9pF3MITpG/f4iy+KzVX8SXhc72GXj+5yurKGtC2yAfX+9y2V
         ladA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135584; x=1770740384; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        b=C6nvpPungbrLkzSmIr2M50n9qsN3BGhgUCBFXMcjk22WzkBkd/pBRNMkKc1RALy5CI
         JYUUj1Aqv0qKWO9MAgVjy9eZYixgsdizpAR32efmq5WqPsGahXKgW2UCNT4ja2v+QtOX
         CCsS9YK8SWl54SIWmbLF1CiQbGmdCPGfUvAnd+yT1u0XzY4VnZXKasEsWlTfod4ioeIx
         nuUjmK8Zww3E6f9RWi1XHPLXoZcsSMKIJW94Vli0F33jSs/2jc1LUr8kXgt3IOlNFPEX
         U4SHDTQtdA7HPxNmtArRfbERIon4O0fcLnLGa6VeteudPG21ESch2N3qzcKqtzD4thbF
         /nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135584; x=1770740384;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        b=WZ3CgIWi/ozj4dPjSpzGNaObwoeH06nRgF7sUijN5mxAllCo2FwNFVcZhp6onrMfh7
         dFZE/90pw0VgRECENbN81uQxwPdgGmafZn0FQaDK5pReJCQ7buTY27vZNVx7cSSwjthY
         CQZj+9vM7dzokLzscnkCuXtHYHCPmyDm4ofj0709feH259Z3bX4WAwNaGC1ztTLBfUBB
         gf5cIWHK4hY4NJQoYKTm3Vzu2jeKDIb+mWfBL2Ky6SlErUdbvQrfoNHUv/EMaJoh1tRH
         ZnZGRSf7439xIneGbYPDIkBRe6u5IhK8KDu5g0g5lUFHI4vXN66DsZSWGCfPJq8ps6Q6
         He1g==
X-Forwarded-Encrypted: i=1; AJvYcCUglGcxrPQmSkHCyzL/pRiYIKbapkS7ghuXYyGVaY4Fg5jKh+Y9KPW0FOuRKJ2GEZiPMb7xcMnwLsdskx+A@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz42wR1rEGtawUJr3Mu6+aDs0FpoqQTIO9MC5EokJPBvat5sla
	GoodUDSCYjnYs3IgQp1XaiHX52UqmScZADDa2Ss5/CAVILicCbXkcdAR9ekM8xUq+WZd5HYU8dZ
	j66mCB4zk6zRiBALxDZvJpcBfEReoLDnHDEYI
X-Gm-Gg: AZuq6aIJu+Blk5g3VC2APZDsgXyWs57foKKk9vAcMSrfIJHlTkBdqcWryRun4RJ0Qqh
	eaI5ZSKgnp45lt+Btg+DzVibeK1gP5aVvbSc7/OcyqDRnoeC7jpQ+w9grSFjF8YazfY5XKdIsYc
	jCu0aB/I/3kDi8cM3wa8Ndddg78Q5AVxX2cyFnnAuHaB+w8kqtaZjqkHC/rpWs61XilQcI9PEfN
	XWPta7nf2eauHLQhusPZE3OUjmdOd8eUJfGdVPAyjsmC5fcAdkgMIJgkhr6Bbxe0tJDADYQl4tl
	5w4zbAvIA4Z622w1ea7xGSTzUx+b
X-Received: by 2002:a05:6820:3101:b0:65d:33de:1c56 with SMTP id
 006d021491bc7-66a234318ddmr78957eaf.64.1770135584203; Tue, 03 Feb 2026
 08:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-3-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-3-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:49:31 +0530
X-Gm-Features: AZwV_QhCX4gjFHXEKHhIJ5qwUonHSP9jQy6b6lGB5pLrdkOIygmQw7n0N5iuSFQ
Message-ID: <CAJH1ELCE5=hgq-iTc1xr=Wk0_emDLMfq0ampf9kdf5Ee4Rwbgg@mail.gmail.com>
Subject: Fwd: [PATCH v2 3/4] staging: greybus: resolved checkpatch checks for raw.c
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, Feb 3, 2026 at 6:02=E2=80=AFPM
Subject: [PATCH v2 3/4] staging: greybus: resolved checkpatch checks for ra=
w.c
To:
Cc: Rachit Dhar <rchtdhr@gmail.com>, Johan Hovold <johan@kernel.org>,
Alex Elder <elder@kernel.org>, Greg Kroah-Hartman
<gregkh@linuxfoundation.org>


Added comment to mutex declaration, to resolve checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..4f217f20f1c0 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {

        struct list_head list;
        int list_data;
-       struct mutex list_lock;
+       struct mutex list_lock; /* protects gb_raw->list and
gb_raw->list_data */
        dev_t dev;
        struct cdev cdev;
        struct device *device;
--
2.43.0
