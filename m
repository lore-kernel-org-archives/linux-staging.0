Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C111F37E5DE
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317290; cv=none; b=ZDe4AxQ8DZLwsBz0X5GJaSft2OcubhUH+FUYBB8eENUiD0baVVLXxStz3ig8ago4ADgh/5syxxFP/eTlCaKUrvdtTEEczxSVqywaLdUKWOz6Ykvs9jzUWdmOHYH/nPvsaH2gVBh2mDD/E0ATvoo1yM0Pps6fnvTctQxof8UGR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317290; c=relaxed/simple;
	bh=PhhKSOpCe/E/GAGK6TfFO4BrrpiXBwhPFWTDPIQI8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYtmehq8oEMJubkEiF+NAr/ALjW72ADxJXv3wvFuox2+D9oTU9mZHw8i9NNjMGOZsoUUqjvu4BpV0zKcELFeNqa8TVgwHQxDBCfyG3rQhPI/QZTRH1zD9RkYweS+oX04ocU7+DTNnlw6EEGXMkAHg/sMlsjdPNiwq5Gn75mlYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrZpw39t; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrZpw39t"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351297d9f8fso1794502eec.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317288; x=1791922088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REeqHpbU7sEmHz3kU0K1dMEvaUlqDewtYeD77YnIXKk=;
        b=MrZpw39tA3bwI9eHywf+hJblLjqY4r5bUU0uiybxcPonP3ntlCDd27iyPtkMfRu64f
         0o6JlvL7rlWmg3dLpkcBSWk6mcsG6neZvhDKo3ubcYxkzDHmpKW5CzwYg3LDWt7qdDf3
         7KpXFnQBY1s1bgzmArWuuCGVyXPx6ku6gBwb8YqIirCHkyN3HGkRP81qXMaCa/1gE5sg
         V0U3gnDAgRy6J8tYo793hq76An2ZAqQOXQ5xd97QhQ+LwrXmF5NG/NwM7TqE1/+Uf87p
         B8IBHLSj9QqaE6Av+qbcampwxoxiv79Fg4noChJ6zN0PvdNjd8dCNrd+Zcb6B5fSWu4Z
         1Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317288; x=1791922088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REeqHpbU7sEmHz3kU0K1dMEvaUlqDewtYeD77YnIXKk=;
        b=MKFtT673lP8pYvx5gdR+o//jgvGU199Ih864vgYaKoWSBwMhG2JUGD0tmIK4PCLA9h
         3piKPYpiw2yv0/xCWlrg5V9c3v/3Sg8EwCNpyoUBdNoE6rBdRnI1Li/sgiDzN1d2Z0Hb
         AURejSA/zAs0Aq7t5cnNCTWncvTaD9Ro48g56t5FqBxM7Xh0MMQ17Adfh7KbweaY8Bkw
         Mh/DmpcaL/3zYB91ZnVeLc4jRcD9I6xGkLcvEBrL6HlzXskkVMK3YRMA5y2mHY/us4I4
         JHLqdzXf9h5XdMsgjZJ4L6NIQU7e6ibOYlTquuObzVaJBFp7lgBxwRFFUSL/Vaz4cxsd
         hGVA==
X-Gm-Message-State: AFuF++kkEXwRUkIYZfROJniV6lrGJvrts4QYdV2z2IGNetA6jiGDKGZ7
	+BkUAlSwMrPfoVv924DvWXuEBBBnrQeUFMHr6QgE2ny+j2cbFBWCgizT
X-Gm-Gg: AYBFou0jCo8tZHUL+Jd9Vde31PGyx+tbiKd4TDwamnxJnqnSqHjRM4ciuloU+8tQI8m
	AJK8vEN4tYXNEKh/4rWtUHTDOtZarD/ww2YsGjnFoMc37jWKP8a9vhJahSTC1AoDfnMkQNMH/Wk
	rl+z0D1USMBVCkpbB9lh2oWK9EddMywb0roXxWSQPT3L81dwXTgipeeyI5VU67A6JD8d0onen0E
	/2sDA4zKZQN3JnX7bWTNme66h+1NnCkB+bxHgcAj7BU1ntQnN8OAW/crOhE1U4YamL+9pah3mZf
	zpelNz9cgdTsHxXd8X71rJhvVVBEFBBprM8lfgZ0kkxHnJhuDhdATVS28bcMH8WPWnXeFUWWvcS
	EpElm7AZ0aOCtqCXmrM7rCKs5dcR9eIcrI1yQJVkSG0j2X2j07AAGPn3nDeDmQC4UkS6hJQrDL2
	XmrCJ3wLlboQvsEbCkLeQhFbXdbFgJkl1RMtol6WSEMb/WaEMGGp1vnOXM6XrlcXPQvGWQQNKAz
	A==
X-Received: by 2002:a05:701b:418e:20b0:15b:1439:1fcb with SMTP id a92af1059eb24-15ec66dd5e1mr2613597c88.10.1791317287714;
        Tue, 06 Oct 2026 13:08:07 -0700 (PDT)
Received: from host ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm804946c88.11.2026.10.06.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:08:06 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix uint types in hal_intf and rtw_security
Date: Wed,  7 Oct 2026 01:37:49 +0530
Message-ID: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Greg's feedback on v1, I went through the variables to pick
types based on how each is used, rather than doing a blind replace.

I am sending this as a smaller 2-patch series to ensure I am on the
right track before tackling the rest of the driver. If this approach
looks good, I will do the same for the remaining files.

Changes in v2:
- Replaced the driver-wide `uint` to `unsigned int` conversion with
  explicit sizing (u8, u16, u32, bool) based on actual variable usage.
- Scoped down from the entire driver to just hal_intf and rtw_security
  to keep review easy.

Link: https://lore.kernel.org/linux-staging/20261006102846.170825-1-contact.pranavdesai@gmail.com/


Pranav Desai (2):
  staging: rtl8723bs: replace uint with u32 in hal_intf.[ch]
  staging: rtl8723bs: replace uint with explicit types in rtw_security.c

 drivers/staging/rtl8723bs/core/rtw_security.c | 51 +++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  8 +--
 drivers/staging/rtl8723bs/include/hal_intf.h  |  4 +-
 3 files changed, 36 insertions(+), 27 deletions(-)

-- 
2.55.0

