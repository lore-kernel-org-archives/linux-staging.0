Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750864;
	b=ZDbGfG5FKexGo3K/hSSJQRj246VTDNAy0/EkAITqJea9XCxkBIUcb7OqmSe0zOhnWOx+
	 ntkbl6L8z93HL5oyIK4/XAM1FVtwkJEdA/p5uQily2O6zU2E5HnRmEGVJu0A/YUOaeHzm
	 TkaLgqK/9UNyTWC2sYgaBIDLd7OlLr+SRX3LcrwtsQjuxj5C6qyyfaetV7AvfFq768MWp
	 OLGyA2IPfa09XQpDi/99xZi1FNA16/VEjeOjX9LoroW64iwMKERHdbTJnd/kJtpTwCujw
	 ZmlIcMUSKZqG0mjuuCb2lC0G/0eC23YVvE8uWVuElYIeH21xCLhpdiFaS+LvqJHlJ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
	b=xU0+jQSwKeSv0I9ctK9zcfBgpio9B6/uXxINnKvT2F8x1JXzgOV3A/CFx7/cSt0XybQN
	 4l8Ln8B5YLaqIaC24JDH40Jk6yZaZ5JWc7hqD9essqtpIgCoZfFNLp/H1MtrDrOwCCZfG
	 cc9ODDAvxHM8Yq7ths1p5sTm4deEtzI5E4bAPntECTxEDlHyYvxuyxeoz3OhytGzsO38K
	 3JZ0fUkzjmtNyN8MRRPybpvkYfC1l2DPB7PeTNs0tOqpZ0yyHZVFzVPVqBqkFqYo1RRld
	 vAJIf3N9owLVDyiGzx5sYnjgEEEv1sERFbRDs75zI7pjT5E1HzwchwXdmdraq2VmUKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGGa2qpC;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA00606A323
	for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 13:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGGa2qpC
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3acec6677so3381022c88.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 05:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750863; x=1795355663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
        b=fGGa2qpC665skxMQ3sBdeEjtzAeu4fJ7SOlb6u8RvM/jNv9bRjL7jDVLtmKk2qAFsS
         r5nTf38Ww7qcQokKJLtlxsaWBtYvU4DYSfAa6w5BjLFGSU0gWewW2+0z8S5BCuNyYS6x
         yzNJy/rwjRUYbfrUWBBnCuWvRYD3nc+ByOtKVQD4XvaRSJEkHAs3Arw8CH3Xt7WZ7ggu
         nKyyF4uiATN/xLsumsBpHXkMKairfnCwXTfPNihRT8VwJia1cC0kvcll/Pe8eX0vtlUu
         vWBmu/nGkRp+EtAC/TFOU/kroOwj2Q8J1HbATMUExvsLfoRe/OngvylX0YaSoW8R+SLy
         RT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750863; x=1795355663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
        b=hiyi/iZC3UGsiUDDHcmpJu3e4IVo5OEJzzSamOeWM4futy0b2GJzN4a7+wKmWgg+1H
         P8XPD+7mBceZrpUPm5TB/BRX4u7kF0zpzrfr45lyneWQLq4oBmOeUaQVDh95LOcJ9WPR
         +GNriZSaa2Gs8qBMTiJHT8O4YFzgWVx1FGVBzirExgoaPpJuDJIv/IOZNKk7WPXFZwY3
         Oxi++P8p30hH94g7Cj6fp8/7oBP20kth/G1HbYo6X+/5120KcLFJ/f2cr3L58ahoZF/x
         7BPkMXDALmcupJcHEghhtPaKxbqBpZS07WmIVyEqGTtQ3vZtrbRq9jTGoLSveYRZUXF3
         CCaw==
X-Gm-Message-State: APuU4Z8GEfUm+f8FZDjO4/T82EzW0HahYjDxlDL3IDhHuAAGriRdtvUR
	+4yNpzodK13NCXiHGQ43a3X5+MwK5U/tC+1fGYyfeGcR71zieH4QJ1wsYMSjpDFn
X-Gm-Gg: AYBFou1ANXn68GLTXerrZZPpWNzTsPMd6j1ok1ruCR3PIV63N6YOwJUIFU93iI7OmuZ
	gglDi4kjuHbrPEnrEbmYho/GL4YwUt05v50mPc7CVO/lk8swy5DFieQlG/Yf2uNexTTSJkXWgUf
	yAkVtV/CAaJFzG8CGEUxFVD9XJ2RyGEd6PT5tDTWehK2rJoRdwHBnGmBBHgGiTBIVKnUDcPS4ZX
	9z8Aaa1fSkTklOnEhIP0y/jZMsqgXE+snTKjS+iMAkLz6VloIA2wMrBvskWY8PLpXGiwYN5iPZd
	IN/sKWHani9S4LcT7S2dmKpOlIHjpJuQlYw6W/faAIezlbz4MW0mfG1ugpK1WqFCs3O822mRS0/
	vK8uvkGUuC5/OqoZbLEJZ2GQ7073LwJP8cJOShQxQEwWLdPHzM7Zs1aEIoZvwtybfKIMYRCeA82
	ske9Ws+5yLeeOaRfyZdoRV5O3UEd9OURHjdeMJTh1UqTM8pgKfh17PnN7CT09S0dMzvmrTk4sWc
	pn3LOm12R2PFdqFJzhzXW8ZmluUHzp4P3MRVGJgfrDp0U819GyOMZrfK16wpluHBQtg9aubloxv
	tTFogjWAAQcIfEdfd66sg3pM+953cJKP/YJ70wtla2yhRL4G0II=
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr3976818eec.36.1794750863167;
        Sun, 15 Nov 2026 05:54:23 -0800 (PST)
Received: from tarun-lywait.mydebianvm ([49.205.202.171])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm27641709eec.23.2026.11.15.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:54:22 -0800 (PST)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Subject: [PATCH] staging: octeon: Align function parameters
Date: Sun, 15 Nov 2026 19:24:13 +0530
Message-ID: <20261115135413.13482-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to the open parantheis and change the parameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.

Issue reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e..cc1204e20 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1387,8 +1387,10 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 { }
 
 static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+							       u64 queue,
+							       union cvmx_pko_command_word0 pko_cmd,
+							       union cvmx_buf_ptr packet,
+							       enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.47.3

