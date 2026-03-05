Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F92D30C60E
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705786; cv=none; b=gTTuAPLwrHbHb4K+CriWQAv/QTUFwXqaFmndU5kVESJ1cn324zibRG49zqbDRqesiFPc1HLFBenL9qMEEIqjV6TJP/tpaE/gZwQqDFTCBOaBPyrDWnue9SDWq1ze/Ju5HrlEL/h/6AMyuk7xNafCw/oQPUS3eau5zLbdZACQp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705786; c=relaxed/simple;
	bh=Svbb8jFQVB5NPI9bQz0frw5/oNHducMm02nGCXwx5ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6rIAy4gTsHDR4y7Y8o2/OBvXLSrKQxGMkc2H87RBUyGmR3mcrpCowOxgKMeKzQuMtPtnB4VfcLX/c0jYg8VQLCQOe7Ms5e3KsvT9khNDXtBJ23m6lE0krylF6QsOAzqpn3EMnVJyszqsTCu5LNwy7Ak5l1AUQv/ejTPHRJfCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks7zF6pm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks7zF6pm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso519704a12.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772705784; x=1773310584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Svbb8jFQVB5NPI9bQz0frw5/oNHducMm02nGCXwx5ps=;
        b=Ks7zF6pm16oGdN1qoG11RBXTkht+6YHpzUf/egZt1QwUj7wyWDPUFwuPUSSkfj0eho
         0JkmYi/QEE/xTL+5lGW/qJQl29iPr1W/0uBs0AX0tgtf6NzOOab9oKCr3Hw5fDpCqiDI
         /DwtNgIcQHp14bHTIjHXeE7iHqnCp/BInOxIpea0CWtDt8KJOH0G7RJPgdCz6QQbuiJE
         0uKbd5mK2e3YaxhTbKYFpNGKFkx4whcNQ59ggLQn/2pfaSMflRrO0bniSJDtiZ26Yhk8
         OiaGACbvVoEETBiQQWj0dQcxfYDbV1FGUk1f05AVXlyUTOLMaCKreTWITrRuzTbouOCv
         opTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705784; x=1773310584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Svbb8jFQVB5NPI9bQz0frw5/oNHducMm02nGCXwx5ps=;
        b=HXbgLbtulBhpJPV8+u004XG2I5mBIaNAHAbgF6kikWOb/Lyt9c5yzwZFH0PH8Tav4M
         Dh8UPTRud5HSf6fqHewT+8HWZW/V6C7NcKuu5xlSZBZwUaQvoFA7GxAlwYnSOJyxTZDx
         1PonNek96KD8r+Wx4VtZCC7/JqnXYDJdV1GJkYdEDUIjc3WftdVS058VB8Bl32WIB16s
         bpvG0GaksOgjIiM3xXL7ecOtbX4SKMCbq/0ovKDRfPyFRRNjE76diMisiWV1mDFXPJ4A
         RvicvTaangYECt3BCZ+oG9y+TH/LlfFuRSYeUDzRMwWHNDEe1QofBa/GPIODpj+UX7Qk
         3xtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMj5FEQJcLPNNcWIQLmq1NMQTtHOX9UwXKb8uAvcUJZPYonk9uCZekRiT8VvPN25WonEkmiyDSfBqg/xTi@lists.linux.dev
X-Gm-Message-State: AOJu0YxZNaW5U0HPoSn/WRIjvwF81HagBE+3rJcGLHChkKPWIsR7cW1A
	Dt+Euq5sJ7UpY3t4ZsOE1eAOJHnMt3JeNB+LuGBDnfH6TKyObCzHg9qR
X-Gm-Gg: ATEYQzxRMD6NjzrhVnWhSp8IqzXeLPvnj39SlvqQtjCJBBIJBY8NVawO5oPOIAgMm5R
	aVnVBcU/20wP7kV9AmzYQwmnyDEwUxQRIbPeOETyGUFVifxw07r+g8l43it5UTxB5+o2uyiAOag
	eZpa4FkA4B6TOmWOYVQvqcFU5YEzVPqRk6kA01ShbYmFMgZS1b8VwQbAEeOOyXVNO+gOccPjohN
	4wfsRabHZBjCFUI9IuWM0Zy7ItBcdYuSkb6kjt9QP/unFJ2QLYlApWG/4Lggm3GAtE+ZdA2rvFd
	VF//mjM7P+k+msWqMIpMA8xztz4rsIar9WHxHrGJjjvKU0HGmri3eWnvns64O1WUeJCJzHcwT/j
	h3lPConZP8AAQCXcRhZOK5Yj5/3g00QOXPKJNQQ15Gnn0DjtxAOPTKHzIqoPyjYF0d1EBK8PbWb
	8QRVgSv0HF2rh3cFJG485mGJf7lvT+8SLLg91rSKNGtJKrNrw/fD0POttzyeRYhRCKwwUF3myva
	Hwc9D2tpnp37MR5zjq94G5yc/zFWKwzzJNoVvAh3TJH8Sc2kLGIXt4dITuZEZlPwLfFFlpFWx3/
	dbRXJ3vA3LSg+Nzb
X-Received: by 2002:a05:6402:1ec7:b0:658:cb40:66ea with SMTP id 4fb4d7f45d1cf-660ef786d2amr2888396a12.2.1772705783567;
        Thu, 05 Mar 2026 02:16:23 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d113sm6418308a12.19.2026.03.05.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:16:23 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: dan.carpenter@linaro.org
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: Re: [PATCH] staging: most: video: fix read() length underflow
Date: Thu,  5 Mar 2026 11:16:21 +0100
Message-ID: <20260305101621.42751-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aakjBUMpIKpFkAWY@stanley.mountain>
References: <aakjBUMpIKpFkAWY@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for the detailed review.

You are right: given how fh->offs is set and the single-reader guard via
atomic_inc_and_test(&mdev->access_ref), fh->offs should not exceed
mbo->processed_length, so my underflow concern is unfounded. I will drop
this patch.

I also appreciate the guidance about documenting variable invariants and
where they are set. I will include that analysis up front for similar
changes in the future.

Regards,
Alexandru
