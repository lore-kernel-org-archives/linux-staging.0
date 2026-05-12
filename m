Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B527A907
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 01:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550301; cv=none; b=HEcXYsiqidqn2axqVoAxyBCmn7eBu1dqm8CmBTfvKhT9T9ZvaO75DlhBNdEXlAPZ3AZKzBl3q/ZB/tnJkZCVEyw+F417q5qmwo41jAdOZvOoLRfnop4JvkNK0LNKMtl1RlkXqpt9B94bpf4+9qORWDPxnmgf1HtfZR/LVPx9Q7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550301; c=relaxed/simple;
	bh=CM1/CZ6HdJnVUKbVAC2ZuNemS78xv0T3WdNYnJONcu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZMYOEUcChwzWAXqdajqjtXTHlg0wBkrsmpm5O9oAn4VWgxIZVo36pawrQ8UoGxsBqbNpNdnFK2YQQmzxPr6hm5sONvxReX3S4irVx3oZ8JmgB8reoRZcPxyYGtnXF1HfxwoqaL67mELFppvPRzbVMy5vrKoKoS7A8Cj4lKC2PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxkQ+fJN; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxkQ+fJN"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso8653392eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550300; x=1779155100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoZ3CghkLfLolXcFlwo+7ShlWPK5OjniN/Ru2vBn9zw=;
        b=SxkQ+fJNFt7sQ/kdqW4RsyZcefnguGzjMejtJnQsGFbaM0IGCrlbUTsJAkg5qptd2A
         7Xhh6ipwlMPExXX6+5Xg3X91sSqtJwGNYgjixnpU5KJ+jp/7f5NXf3yafn7W5Q4QGeK2
         R7lGDgn7G/1OEuWoeYP/DurBRRp3fqquo6NnvWouZtxs9d6tfAxt/I5Rxj9OBalFiH/7
         bgju2lKmpRG07ARuXJtD0hCMxU0vHxKwKHTC4hshCiCI9voBS1iLaTPv1K7h+6XkBN1J
         tAuHq5hB5vvBNl548TkZiKKZVBwBqNr6IOsD4Bj5ejesUZiNlH8REJXrO/DZMr+/Znfu
         Fwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550300; x=1779155100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoZ3CghkLfLolXcFlwo+7ShlWPK5OjniN/Ru2vBn9zw=;
        b=HVY1IvfyHHwi/pUYTKKlFt8xcJRC9l4VJg4Xrf70zSFny5SUqm7jvVW4YKqk/RQVG9
         2k5mJ4YktZq7Vd/t1/2MQ2kcSkgabGAWNtR0HRF0yKqOWawkRbtN8yPRekwa9cScn9Nk
         LgJqMUXbwup2P4Slccf7nEkHMsEFlLI3aW1o2lBz0j6F1gqc8gV0IeU1p6BGAHK0Q+Op
         B3HWMYxCPDyg9CMvDCDyI/4xjYwZK9npmNNYfjMkIB/bveRPPCT4RZjiUNn+usj3+iy0
         ToNsjl9YsFjVbVhrxnTXL3WkPrtxBPfgF2YCHE1pjJPh6ALgf+s3uj15l/npIOgJ0khg
         EYrg==
X-Gm-Message-State: AOJu0YzqWUe6JuLK8xCEG6g6wYXrPo+1rQ83fjbwQfRf7ewdEgYM0Vk9
	DDHUKVCHX7edjuy+SdO+lRpsR9cT+qlmh2lK8M0TmFqHDIRedjDZfQH8
X-Gm-Gg: Acq92OHpNCT9oJUWOEtewizXF4um4ryk7EQWvziRjrlC/F1aFMCtkRpOIabz9RrIAnx
	Od5gRZ2VfAzj1Kv9X7guVKpAON7jOE5yL2URef6hDHd7AKkxcj55YQtZpTMc209K2vJA9QK/zkE
	oUSEdj/1LB3RDFkjZxUOpI7mM4hrGwhqdu2Z5F5jjo18w1/GRM/NSqCMNh5G9hO0EVIkxlZS6bz
	Vm1jWXPC9PMhagtj2rjXMFjVuB1m9KBnX4eV5Yp0RWqHHAEICOBs1JV+3ezpVGcyIg1HWlounHJ
	E59iuJpbTrAzOYSlDaIDGCcC+0kinTn+NCkw2gsXNiwFNLE3zDKraRvaWeJOzVtwydFaffKeSxU
	dXc1qb5MWIhRZGGlFfxUsyIq4q0A035UUZWAi3ifP1vID2ik8QmU/6AKY+xjl3vOaEnKwLvS+dn
	YDLCadzlfnKwTdF4lFJTLUIuwbSdYTzYlTpf3ye9GjJKSzZFG/CaXmGGuNiG+L5fNAVUUMYyT5j
	KdDv4w=
X-Received: by 2002:a05:7300:478f:b0:2f2:6dde:df53 with SMTP id 5a478bee46e88-2fb4b733e84mr6826603eec.17.1778550299405;
        Mon, 11 May 2026 18:44:59 -0700 (PDT)
Received: from localhost.localdomain ([50.231.3.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15816499eec.28.2026.05.11.18.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:44:58 -0700 (PDT)
From: Shayaun Nejad <snejad123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shayaun Nejad <snejad123@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: fix two remote frame-handling bugs
Date: Mon, 11 May 2026 18:44:54 -0700
Message-ID: <cover.1778550157.git.snejad123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two rtl8723bs receive-side bugs reachable while handling remote
802.11 management frames.

The first patch fixes a use-after-free in validate_80211w_mgmt(),
where decryptor() can release the receive frame and return NULL before
the caller reuses cached pointers into that frame.

The second patch bounds the combined SUPP_RATES and EXT_SUPP_RATES IE
lengths copied from beacon/probe response data into the 16-byte
support_rate[] stack buffer in rtw_check_beacon_data().

Both issues were found by Kuzushi + deep-audit (Sonnet 4.6) and
manually verified against mainline.

Shayaun Nejad (2):
  staging: rtl8723bs: fix use-after-free in validate_80211w_mgmt after
    decryptor()
  staging: rtl8723bs: bound SUPP_RATES IE length in
    rtw_check_beacon_data

 drivers/staging/rtl8723bs/core/rtw_ap.c   | 6 +++++-
 drivers/staging/rtl8723bs/core/rtw_recv.c | 9 +++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0
