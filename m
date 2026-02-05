Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E70427A1D
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306813; cv=none; b=fe9MAJjq+fYygy6avw1fpqM52G3c9RvEAW052XV6qvy5sdbKiSYNiWFDShK03f/ro6tSG+qO7mzLNnUPnmKv0cVfBBttm6+y7SasZ/qs5a6oeF6RZow1dapPpyKZ+WXhu1tIz2K+HH2zOQdWbzNxbwt9aaETaJOfM/jZyR7zoaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306813; c=relaxed/simple;
	bh=JhGbd68EVsksUiqCvpoR/6lT/851KMu7TqIkkNkCKKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=k9OrSddup2psWHFUt5fim/Ubh/tc0jTbMqVSwswdYo82CR0hZRaRJGQAMvrxyMnSdCZ0l08Eeozl4uMi4yWDvCuR1TpFE+5jHyY3NlRYxdJFp9Oz9q7oIre0wBD7RTJyBqS8ADHo/qFsGGdZ3pKBPnEZFMmqMwep1Ym1maMj1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgthTfek; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgthTfek"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649bd1f08acso1235108d50.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770306812; x=1770911612; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhGbd68EVsksUiqCvpoR/6lT/851KMu7TqIkkNkCKKk=;
        b=FgthTfekv1NONl6ueuFsTR/DrSIj9KSkkDZsVF5gNwn75CjNCb62EjfeCaCODQzbim
         vDMZfyPNNc7VKBT/EPKmRYe7jpux5lBXvfJvvGo+4Xvn0B1TEc1HEVaDfXAFlUc7mDK1
         Jw00bygSkDkOTD5bNdmwWSshJO826MivZtr8YFhXi+qitlq0nF23NbdIpwbz2cGTrEo5
         6ZES1KXBlZHIhk2eqg6Mgb39p3Nqafl/AR2TM1ATzlCQ9TnHnSCysBQgrEkRCeAuHKO/
         Oo80EKqG93MGoO9tL9nrtVq9rqzFqrGsxQ7tQWaP39qHCp9Y5MBlmBylr7y+dDPg1E7u
         t7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770306812; x=1770911612;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhGbd68EVsksUiqCvpoR/6lT/851KMu7TqIkkNkCKKk=;
        b=m6MSTmWUDXvpTIbI+D+8srk/8v4ob1TAA5U5ma68r+WNXZMRXE5rUN3sXIfqgVZ1TK
         uvjMLcrDJ7wcLivEFUVSlGuU7fHze3+8ftzh7fh57f/6j3IXkWu9AA9cDC4eUMHbOYwy
         cCVB9IOj1G2d8VOOgbrDPWngH2kECnlgOrxMbXfJhfGcqMj25J6N1mMJlwUA/hVaJr2h
         5h2/TiXsowXMo/9pGQxwEmZRgyrIpjVkAVvhsLfKsKTuBX2n6HHrcLcFbAAmleW+JE6C
         IL/WxxX3o12ZF8k1tVz5Bs2iaUi2bgk8uFAmaXk2YkM0BTiasiS4h28KsH9jC5OQrGRI
         t90Q==
X-Gm-Message-State: AOJu0YwTQiy8hmjd29IiAZqNlKB8O9iAhTtMgqyZKs5zlXTwa0+oEI05
	9/pfcX9nuqQ+RMZ4lQkpr20TbU+fOwChVBtBOtH6pvp6wNW5cMpOLg07
X-Gm-Gg: AZuq6aIddEZsrgL1Y0HUUJiHAeVDD3/CqlYL2dU3ciigMsSccJUwCW6JV2ks6Xc6ObT
	j25v9qCmjOxZcXVYr/DBCs6MQq3lKi7JZ74DDjo36u/SC3ClJ+LmT1Iy09Ohe9sLv3GKMTXyNwC
	D9sFVCA4kMkzxnG9h1xXTQBctgBKe2/HJi9No07prvYOomZflAn87TxfmDvm/OhB/yNkSZYNsYV
	0e3XJ+6ytyA1im1vEJfeV7aSUeWqLj23Zp7wsPIsVMaIgyiRZ35BEnHZXFAt6RSMHl/zxUKOqj2
	PXHrkx/1IYT7VR5N93Sg4py8mkHF2A3lqGfKe4tYwnZqCyRXxY/Q/9WIboci7Rj3xvn8YRh3zHo
	VagJGuncV12M9l//u5PEJNTuuqQVL5J7XtmAdl0VjRPjRwHStXrrsZpXcpW0YSl6z09AMG10fvi
	v/iBIssZYJ1XpFXcVzAMiaa/gZkYhTyok=
X-Received: by 2002:a05:690e:429a:20b0:649:bef7:1f40 with SMTP id 956f58d0204a3-649db4c5076mr4629527d50.85.1770306812001;
        Thu, 05 Feb 2026 07:53:32 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc494810sm5621703d50.4.2026.02.05.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 07:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 09:53:17 -0600
Message-Id: <DG75DVGDRTBP.3UNKFULPJYWP4@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: constify _action_public_str in
 rtw_ieee80211.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260205120909.161336-1-tmimiharoen@gmail.com>
In-Reply-To: <20260205120909.161336-1-tmimiharoen@gmail.com>

On Thu Feb 5, 2026 at 6:09 AM CST, Haroen Tmimi wrote:
> Make the _action_public_str array "static const char * const".
>
> This ensures the array entries are read-only, preventing accidental
> modification of the pointers.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>

Looks good to me.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

ET
