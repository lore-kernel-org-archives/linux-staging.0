Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58B22A7E4
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418010; cv=none; b=hcy719WblB9M/Kduzx7MwZ56AhvhiHOditCbcrU9O9QDVbaUTDKkRTcylmPscx+tBHrSntb0KFg+s8qP/i+gV15kd4jzTBIHYMMwvzXUdwQ9XMAxXpWYpZ1B1c4R+s3vkvt6gYX4gphYdm9bW09SYx4wRiXil3wT6fGic9/Z7os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418010; c=relaxed/simple;
	bh=6ZBc8fRpWWimlEar45e8ydK+XroQ1shuZjPkeUVJZwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyROt4Kpp43iMxXcPHULWnfBLinIxwgfY9uMb/TTF5bovylx3e5Czrlvdy19MaxbF2FyiVYLEjDdW8JNkIgQ3hokNG2dqgSL2MmeLh5Sy2w8m9b8qmmdICslwYZ12uuKo2WWx24LR3MX0JW3YN/ZUgf0s36L3tOe08YXmkT5cvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6vzUey1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6vzUey1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f1bc40b35so70407395ad.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766418008; x=1767022808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZBc8fRpWWimlEar45e8ydK+XroQ1shuZjPkeUVJZwM=;
        b=k6vzUey1Z7CrJzbl6p99ykc/bsWmHtOUSR5x91grhhT3fCLvrhZvma+gq+RH9sLJgp
         OwitIoRWxVwtHD7LXqUa6KvXEojtJmIwSdihLujSFZYdmjx4NXj7nnnyd7s41JwbRGof
         RVXPiNcpr8E8lCvnLG+/8QxGVNYbiHmDZKPtuyIPoO0qT3NpsLfo5eT8DBZMCk9Ff3jY
         3/MYZjYxfZaMTXk2yOJdV16URP6Gp55KNfjN4Y7X/AYSomufw2ZFGQJRbau8hMGkR+RB
         08fluJFS3vbuVABSchjAk4H+VL5xkup6YXZuGiAxm+AABHStOJidQj7GyWz6x9KSmy6G
         lk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418008; x=1767022808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ZBc8fRpWWimlEar45e8ydK+XroQ1shuZjPkeUVJZwM=;
        b=HFEj4sckjS7Bu/RTyGGPTxaZFGW0SQhXElVfdJ28RPYbunKxt6mMaXVzfyct/s1icW
         1CNefolMqjAo84UIB8JrshjBu+N2EIJN/o1smJSTx3BUxbAnDyFHn2KRhHOAbSsY4vSr
         xH2dkjWsLHXdVIrhDQ76F8fMJu1iLAcVfOXky/iTxkRZsw75/gcIaU+9owD1hMHaRSEi
         PjmhFoC06S9qOK/AL9BCuxZ2kmQy1rS0nKIvSgTMQvarHOMr8g+ZLzX8GKN4TAbSR3pw
         fdgiVuuPNCeScGTRQ614dzObws2HLycdN4qSdygXn5OaZcmf5eyjHB64JEubZk8+CH12
         8PWA==
X-Gm-Message-State: AOJu0YxuAwrs7RskTUh2eMBR7VpyqRHLt7kD5+Z6m5bhpoWmuCUWbRc0
	ensrtpJbbNG4PHRS6XOi4bC1lfMoSBrgyczCPlDVfdsdnF3oaTDBd2CF
X-Gm-Gg: AY/fxX6JmotRXI2EDpTP2VGw4w6Ci7UOEsa+O/yCg/dXP+XJldI9TXjTAV3I+dDPwGX
	l7bVdns37x/+YwUd+PGM8Hvk1JC7/KmOCwI2BoXGl2ArBF+S3WoaeNin1fo1aCBWDR/U56M/nnb
	cQ9ExA6uWOJhfwOh+2/VmqLQXx+rpCRCv48/QGXCjfXS10B7dFY542nelV5uf4c8b9WKo3CuFDf
	WJmZu8pe2ECHJHKNWyL9LyFR9jTRw9NRhU6RDcfUjp1ILfdEx4Cu55olOFumM9V47tEYplsHhK4
	OiP8Cn15KTRoL45Bj3eosNUJ2aeSTuh2F1/ZIFk1Xpm/oXW74oqLpcOyrXtAWcmwAQgQ/pUvgMc
	WjzVXaHjTb5RhiQOB6lny+zEKOR8zp4XrIcPP0yjxRJvvebWCtLtkrLg54RHIIjp2rYB2fXPnav
	KW5ykoZKev0RigqlAyGlOH0FcNuNqCWs5e2To=
X-Google-Smtp-Source: AGHT+IHRIBJOk86oxm4gex++y4EXy7dwbhmmVB+do7NO8mMjTkzxwNTyGnD6yo7O8tHVZTHhKQRfVA==
X-Received: by 2002:a17:903:2441:b0:2a0:b02b:210c with SMTP id d9443c01a7336-2a2f2208e65mr110068965ad.1.1766418008165;
        Mon, 22 Dec 2025 07:40:08 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm99981965ad.42.2025.12.22.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:40:07 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 1/4] staging: greybus: gb-camera: use BIT() macro and fix formatting
Date: Mon, 22 Dec 2025 23:40:01 +0800
Message-ID: <20251222154001.68663-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review!

I've split the original patch into a v2 series as suggested and
resent it to the mailing list.
