Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F093890E2
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084284; cv=pass; b=J7jEjgr6U/dW5b6G42jS3esrIGEdXlsZC4mCJSyje6rfUgBS97ACs8Ykc5LOZ956prQKKzw/+M8tPoAvRRSF4pzI72a1tafrR6ECuKxvIHlRNoSJiDHDMUgqBpTmZ/T73xPy/ZK9qqoTLAHodAnXI3+fjqvvJzGKKV29lRPBQ34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084284; c=relaxed/simple;
	bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPbIiMdoYRuPbOqXeaYBnVMRGKn/A1WoIcCPTAqnpFRmmqWxgU0sJL8vMVC1DriJglsGGrYDDA3yLIeRwla32d7nz7NYxkAk7VKgTY6va7MHyzSW0nux5HOPOiXRhbILVmySXNqrwO3H71b5UNZ/DfNBOXuGIKmfjHI9BF8en0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/QS0jbW; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/QS0jbW"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9116861f004so509764185a.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 23:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779084281; cv=none;
        d=google.com; s=arc-20240605;
        b=FZKnxwQ2y6Ka3Eycd1+pz0YI2Q63bQJUtiSLb8+p7D4cHuCuSRePmTAZJxM3DCVFim
         UbxWecMPKxRyW6XMurPR9su356p47lUqF9b4CIbVYDMsaYxUnn7P5YKZXzkczsyyfP5Z
         bPpogGl7OoSCxBnrR9/MdOaWiXVPCS5Xc1tzH8CXLB3nwCSToqrZQ5cdQBiPP4fZ6pcS
         xGnxEv8pwEapD4vquegAT90FR7lBSjhfEhb1aYV1xFmUh1X5ooLQquhE7rw8XHDH3MqG
         cFcjEeAzqhuou9/Ld/yhgQKqkYQ9r2zrDMrHEPJvyaHFh3qjtQk+tnp453k2cE4332AK
         mOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        fh=PdOOLC8nrKeggvbQSrEUtNhCglvHBGhtnhlQGi+5qX8=;
        b=FfXFcG6aqtYb4AhkHpadSuWXkIbxHOpiQTYM2wkXCC/15XE9AStJvj4yxrbVjY1kNb
         6KJrM9hKG2cLdF6AnG/4m5IEDyVUkwYyGv31NoMiCMS67Z72hJJGAa6kIOheTC3O2eQp
         19Y8TJcF9sRZ7qfWa6g+F2VRiBz93kYl3QMKD9AgbbhjhpurAAaGvl76vD/0MrGKdjWM
         PBhpteuZfPZDwqekuqsfTmv+1i9GTwRoNc15ZECriKh+bMmnS80+gKLdoolq6m0y62JH
         AHioCHfEFUdaCjNrtXytgUGgoJQ5VQ/gIcE4762zembEt2UAmAB5V69seIMF/BwWvreg
         Vh3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779084281; x=1779689081; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=Q/QS0jbWNtp0xzw2z6gdVvGJuclrjw8xldwxfPoWW5vn64o/47hBAOkCrvz3FSwZus
         HcUxO25pgULtykWVuP2tmzLBmleXC0sONa1wOdYtIdFq+Hrivqz+texxSAxx/KrMlAiR
         VagXhqfPrGM/xiTnbb+fwtPPaFBAk9U6cQvLoN0T4rDV59iyZEYn9IL1HRvIVx1w/gj5
         qE2hRPKHDqbEHuksltzASyuNkDN6rwfg3SugbcA7k0ryL+beTOKLoP0aXTBgNY8iDHKZ
         55ObFNc+ZvhudkVD8vmUpnK/DgHc7piOWrgZV5A8bHUGVhbNPfFuyAblmK7hsHozosjc
         0pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779084281; x=1779689081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=jkFGWjwtokIs2Pl/57NgdWpXOxiGhyfCAFcs6tukOxbgYzC5zLwO1aW8S+jo0eT5KX
         QJlkAp8mSyJPjWFQND514Ozsp4yb9md8/Mlwzxk0IZPRrwry0Ye7T7D5MNfFj/iuKHi+
         o5OWhaz+TqWIud/+FsflHo/DbiruglSOXg02NE7BPAab6h3e4+hGAPwfEsAIOrd/vS1N
         4RZM3lXmRhwwgX7rdGDwwjW9fsrEr1Oi1LhTCk45OGgNEzQLB6wKA8CBaaAhKqnBjSSn
         ZgqGs2n2v4TaU481AejBMrapX0i79peXW5/fuE6ynE52VbdvntvHNGalyPfWhpWksKqh
         PoTw==
X-Forwarded-Encrypted: i=1; AFNElJ9nre21p8joQJZLR238m5MRNXxmkA8okyDxWIj4/oeeMDyY3gWVZ9pwkXk6x/WPSymTyQO0UnUa96rxyYBs@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9GoLqou0s5wAFuIsXHtq0dnmII96uzHql44fvAfWJ95Czm1pC
	S7PdKQR//7evXttTgZHw7PJc1W1QDikQ6m0pChbbqYXB+9K92Ms6KmB7eFDpvsJ6efzZ+RyIQ9B
	ix6dMPYezV6bDYaKZ8urfpyyblbVpmjY=
X-Gm-Gg: Acq92OE36/NSgta90QNl2Grtlq4zQ7t4V4fB4keBQ+D2zAOana+SBTuhUTgQxppIxGY
	1p0Brx+dPsIqptyCmLG6xj0g4l+S6RhuhcBpc84eNvH0uKQZGvqCRPZx8l1TqTbhWzG35XxQ+FA
	I6xnBwgwiGZTnXuMcQUF1wOl2J4q9etNyJmmpSwvx1gcTiFnVCjVoqonJJ20p94Qj5/fMX9LMQ4
	hkRScoRlNN1F+Ljw5DjMD5o/wQ4/8YgpiGn8CfIKGJB7wtE9TqppL6T7DfqrWsLc4VTIzU0hD2I
	P/rE4gXIvNsLKte7ebaoQ4WQB2KXMFrdO8PB3x4=
X-Received: by 2002:a05:620a:410e:b0:8fc:96f7:fea5 with SMTP id
 af79cd13be357-911ce142977mr2053074585a.20.1779084280878; Sun, 17 May 2026
 23:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517060511.231437-1-diegomancera.dev@gmail.com> <agqeyhCD9g7IjqjS@stanley.mountain>
In-Reply-To: <agqeyhCD9g7IjqjS@stanley.mountain>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Mon, 18 May 2026 00:04:30 -0600
X-Gm-Features: AVHnY4IBX1C6cTNlrKPXa2psS5dvgVqHLE41K50sutelMdmLDd_-PPa_4a1YKBI
Message-ID: <CALruWrX5Cg2_Vy7up35AapbOAoEjLW5zaWqSxNqKriVaGh_bww@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thank you for the clear explanation. You are absolutely right; I
completely missed the sequential pattern of the values being shifted
into that register field, and using BIT() there obscures the logic.

I also appreciate the correction on the commit message regarding the
signed overflow.

I will drop this patch. Thanks for taking the time to review it.

Best regards,

Diego
