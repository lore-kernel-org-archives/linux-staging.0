Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792472389;
	b=J605DhFyam00z12F80q8j57sfgfVzsGDKLfCskmzwFG51PV9JjQ9cRNCDN9p9sp8T3ZR
	 PECcon2RW4eAGHZFROUd/ugnwAQwQz/YmL8x4pgqRJ6WLTwqOdQaBFG94S9oxVQyNjCpi
	 1FWI9XfQypk+WvU3j0XySpKrZUwBef/A78HG1iqTu7ZQI1sQFy2yMsIxAg/eZhpG85Djk
	 x8PrSq2g0pCCzXoWMgpB8Yqn5cFXZ7EbWfOQCqkIs8DGa89HjPEMT0aNp78Gd32uNepaA
	 S2JhHfT9HcY2QnBX7RMUGjhK+Pz+WKEqQAFp2p0c/qK0H4fKC6UgqmUQUOi+XZ4ssVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792472389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ErKYrIFCZ/79R1M9O6pYO8KYt0U4vYvu3GosSii+BMc=;
	b=wugyhdt/zPC2BWF4wLbN7WELGM37JsG10g5+itoXyccYOiOrulVJtfTQMl1zGcLRLhRO
	 0PDCQf4/cKmW7YOgl+2YGgD37Dexo+Mk9q5LyD6xOTwBuXnm69AebIP9xRB/YLzqGV2Yl
	 /slgj0L7i7OSqX6lUDew70HTUMFJiaNG3u4XTEnuPUlSYAUsMF+xoEofVG/Mak7DZDLt1
	 Zo6y7Kpxpj0fqbEWTFQN4oBtT0T7v2Xl5hIYovm1dzUxizUwpaXYMtX4T2PF1ckdVLYQ1
	 dazQu3D2l2bJt5Hjw8qlJEOP1rv+BAlHKMKwgD9FvHCK5q2opCD8Z25DeSlqDVMEFDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYY6gFIW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E673606A319
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 04:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E673606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYY6gFIW
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3681500eec.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 21:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792472388; cv=none;
        d=google.com; s=arc-20260327;
        b=rnIBjk7DHQT16MczvVWHP/5xuLnKJf/+tUJsXRIy73SkBvtz3cwLEKD1ufhDyK/lrZ
         kPaVIrRkrWSqUSDnBqKN8F3Q9ThUzh43WDeOJZ63+vSndfTQMAkDIZNulNeLnkJ6kKsk
         +s2XaL6O9vbp8jnvU2ROyEhWcYRp1Z6wpBXVDQz0Fy68+bjgTe+S286Ny1jrocHJe91c
         TkiJoYP53OdPlEr0JjcJASdcBrtzkEjCEdWyXh3+FXFqw2hgBrm5N0iBMMCIrWOFzgWU
         jFPl3rp3+Og5WFfrWWblPw/W6oN9M7RG9gX4exXkDKL9Mp2r5EJSCFpTCnSBwMqp2qaD
         SVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ErKYrIFCZ/79R1M9O6pYO8KYt0U4vYvu3GosSii+BMc=;
        fh=2lTWXfXeL8nR2xv8wUm6hrYiY/pFMvZvlMlF8hMSbh0=;
        b=aamBP9VmhaGT+IU4hS7fMJtrp763U2cuJELNutLBWt9IsKlbNWvC9ofUj/9Vzysbms
         LkUgJHJRGJewtP/JJEZyTfc5XQq3SRiVDTi1zYelSz9RQsBHxLraZUNFj6lQb/3jDZp0
         5MLBnQAsFeEuUPDZkCUoqjLuB0c0kKAS0DfWAgeHtDpX1np1xgqNDlcQEo09BJp3HGAh
         QL1uWYxc1KGQnZuTJoEiWmaMLeNdNhlxoP23wTmpiVN3Et7fNFWyhDnV+37K3KMx1sq9
         IC+EcDvVmRCoJsnPV5Rgmu8gerbH1s4XsuJAO95zm9c86hjdZKLh5M3fTm9uETmuaiAJ
         H3Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792472388; x=1793077188; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ErKYrIFCZ/79R1M9O6pYO8KYt0U4vYvu3GosSii+BMc=;
        b=RYY6gFIW1BjPbYOo4q/1lFoDikEmL7+5e+W1FF7UJ8g8iEOD0a5o47ts6V+0JY/ZMi
         Qma5PpLSdLpl5TfH6yfnvK0rA0OpVbJmjNIyvmlLHh4fv4vFuJ4FUBTIYVqj+jIuesnL
         oEq787gaA3bcEMV65gzym/8KfUTZZnkgNi3yZItdKIokuB87LHhBY5vn95O8TwE+WH4z
         W/gm75jd7BGfqWQCDNRiELUZW7+uG49cB1E6n84VfF4KQZbinkqj36Rqj5LN/QLpndn3
         mbMsasRu9IErGkqlxkrS/dqgNmEnbolWBXD2v3GowoDXa7dMC2L/O9/Ab5oWfyGNomzI
         RygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792472388; x=1793077188;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ErKYrIFCZ/79R1M9O6pYO8KYt0U4vYvu3GosSii+BMc=;
        b=VYo/KcM3CQII8RuRhEOrIrvd9cpN+H2RbwsGr5kS7t6PTRHIxqPaIP+zZJohAnDi8J
         w7IK3vfMk4pQxjUSeT5TJyS/wOr3J4zXGQTxthVMEj29cR0tErS2r4ybvdJ0xo7gQUQt
         7AFeXPsfirGUW+ol98wp8bHrHkZg70wd7G2X9YNySXGc/7StJtbdmnJ7D4qv5HqTYeCp
         yCE3LyjHw0zPTzvODFwYjQuTCUz3yOO0fMHn7E9DGieMSoc+VP+xVMmnaY2hFQKFxaCe
         PYFReLq6ePrFVMNNnYGZohRfueavXxCR1U7YjCk0lky7CjVsXD/0CTWRuCJOI4IyW7lh
         L9tw==
X-Gm-Message-State: AFq9FYK4PWEwnfWejhzDd6jpmR+1xRWSgxH2gwDI8d3PMMubn46da8AR
	ZXvli0+Ao1n8LQre+t61tlXWVQ1jMc5elGYW3zgngUs8fENWN0ZFz7kz5w33w6fHh6QbXQVr/zP
	cdeemDbJ5Yc4k9h7PkLW1YzUt30LOlOI=
X-Gm-Gg: AYBFou2iGlZQsWkD+l7y3u/C5y8ABGlmixDy5N44Bfs9jrhpx4d2urYk/MtcYLo4aU1
	haCTLGo38J6u760KQJTNJs3JZw+idDEu4fizM4Az0vPscYV3u5XUlC53Y33ea/huXQQsBNky0/e
	mzV4YHBlsfwFea//9/wX1wZoT/rGdJS8B0YArzrP+ic20PmmBtn03gDFdV7MjYALVWITp/w34+S
	IPB9PjDPYMZnJ9P65uRqf6WVej/YyBX6sixBR2Weig+6oIiI6Z7JO7ynCMfdNH28sXTZqXZaPlP
	kfK4r4oojJdvvKe1uIIvp8EjzpdpwgKEwXHbujvTJodB2A/LRv3FyH1dUugylM2KCLSUY6PeiFV
	zpC5lXlMz9tKx9L62qXcKh7oXKwqJesTM7bI=
X-Received: by 2002:a05:7022:f511:b0:186:5b49:90d8 with SMTP id
 a92af1059eb24-1865b499174mr11078616c88.4.1792472387864; Mon, 19 Oct 2026
 21:59:47 -0700 (PDT)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 00:59:47 -0400
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 00:59:47 -0400
From: sarbansah151@gmail.com
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 00:59:47 -0400
X-Gm-Features: AclHuK8u_B4VBr2VoSmI-Sj9vq-BYKM0E1Ql1kGuGmd5hYv2n25yCYb4wkgN62M
Message-ID: <CADyAg8dZO9PfT+wkj-qDAEAgBOs8AK0fjs5ma4q3qAT+BKxOBw@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace yield() with usleep_range() and cond_resched()
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

yield() merely reschedules the calling task and does not sleep, so
using it in hardware poll loops spins the CPU while waiting on the
device. checkpatch.pl flags this class of bug ("Using yield() is
generally wrong", see yield() kernel-doc in sched/core.c).

In the firmware download poll loops the git history shows a
commented-out mdelay(10) at these sites, which indicates a ~10ms
delay was intended; restore it with usleep_range(10000, 20000), the
correct idiom for sub-20ms sleeps. In the firmware checksum/ready
poll loops use usleep_range(1000, 2000) to rate-limit register
polling.

In the TX path there is an explicit comment that sleeping even 1ms
causes throughput loss, so use cond_resched() there instead: it
yields the CPU only when the scheduler actually wants to run
something else.

Signed-off-by: Sarban Sah <sarbansah151@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 4 ++--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -634,7 +634,7 @@
 			rtl8723b_set_FwRsvdPagePkt(padapter, 0);
 			DLBcnCount++;
 			do {
-				yield();
+				usleep_range(10000, 20000);
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
@@ -893,7 +893,7 @@
 		SetFwRsvdPagePkt_BTCoex(padapter);
 		DLBcnCount++;
 		do {
-			yield();
+			usleep_range(10000, 20000);
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -192,7 +192,7 @@
 		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
 		    adapter->driver_stopped)
 			break;
-		yield();
+		usleep_range(1000, 2000);
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);

 	if (!(value32 & FWDL_ChkSum_rpt))
@@ -232,7 +232,7 @@
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
 		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved ||
adapter->driver_stopped)
 			break;
-		yield();
+		usleep_range(1000, 2000);
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);

 	if (!(value32 & WINTINI_RDY))

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -328,7 +328,7 @@
 				rtw_free_xmitframe(pxmitpriv, pframe);
 				pxmitbuf->priv_data = NULL;
 				enqueue_pending_xmitbuf(pxmitpriv, pxmitbuf);
-				yield();
+				cond_resched();
 			} else
 				rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 			pxmitbuf = NULL;
@@ -383,7 +383,7 @@
 		if (padapter->registrypriv.wifi_spec)
 			msleep(1);
 		else
-			yield();
+			cond_resched();
 		goto next;
 	}
