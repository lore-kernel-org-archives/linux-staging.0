Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1D43C05F
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133804; cv=none; b=kGYhxj8IZAKHaFjiCSwFCD3cL6YhG4VuoLRvN1LlNAg5YX/KSTDQui9EoJkkxOOvH7sZGE7S9mbtkb6Zqf7dFy2seINTz1eZTVgwAcnJK1TY1p0wMDvZzt4MMPO34XotmFA8LjTWqks0600u02Ckv1/ba5RJhJwqG7SuTxRUA2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133804; c=relaxed/simple;
	bh=TVjxBgjeu4p6/YjhFwPZDcBbug2d0oOooxWFqKfdL4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VT3XqasIBK5P9hev2K9dQj0ufqye9di3eaiQA3nf5/YmARAJ0Nc3buooRXNjhLYHazmCRvFMA5QgNiqD1NWgPqSViWT3uImz75iS6FH/OpIp35Tk38roDwUZo3NI6xiIq8+XPZpcz/AGSzBPROaFxS49etsqkJ5pxJfNo3LXc6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF5DsYGf; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF5DsYGf"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128cc4b4b6aso3299523c88.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133803; x=1773738603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVjxBgjeu4p6/YjhFwPZDcBbug2d0oOooxWFqKfdL4k=;
        b=IF5DsYGf/IgfndTyi6VxNbsYHk/BMAlRpACuDaPb7A8oi10LgT2C9ljhgqE/7e0kYB
         Z7pmzvcOatTwLmM23JzLbny1QvRa+B1L87OoBA8wsQvXYSIytUMT6kOOWV14dG39J87n
         W2vHagh+2WujySYm1Zd47nazehJ2Q/V3HgO4lSdfP+H00kRU5ByHNkehSY3UnQv/dvut
         TJ5me8JL7JksDmCOCEIA1I1D7jZV48AkbYdlUjDejJN5dK9JR9s82GwpO/aSPr5XMmke
         7B0aGnX86jmHXoLLajRB8fm4JccjDkmldnzUomRUFhhTbQlQ8LRpBf9STsxG/w9tsop3
         kgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133803; x=1773738603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVjxBgjeu4p6/YjhFwPZDcBbug2d0oOooxWFqKfdL4k=;
        b=NS/SpzeK89AxTw+a2GcLtwq1QUVu9aj45xbAqzBK4Tlhl1BZxuOfOGwgtBkMZdzHE/
         w7aCWgBEici0TzgLT21n6tb4YyHWxEXSbK7slDs5jeFtaoKRExKWd5j8Z5ljsUhDQbKG
         MNlARhJYRhI5DqhKs+eGau6GHoNF4xfPr1K3+8/sVUsJ2PpjBNHxqfoXjqPh+BVlC0xN
         lK3ppSMxHAcb36e6PTHTwy3TR57MlZrSGUQLNdysw0xxeB2CFpoRnuA0yfOfqWF3+GXM
         09JFHllCJ6LoKS5U5F+chSc4og32XOCgG8E8Z1sl+kLxQZjebaMoPrEH7fAhBssDBXFy
         m9oQ==
X-Gm-Message-State: AOJu0Yw8zh4Wtxs/C21h+KexWG6khciW38QDnLxb0gYkpymhJYfOmwZY
	Lud8+ZJxfGijfX5K78HZ2DAgM224ObFMAOYhHFK+qPCdy1LHC1LNfcx0
X-Gm-Gg: ATEYQzzJtjqaIvNM1W75dFMuGIlBJ8dA4pHfaL7y6P+0/dM4x/XsXtyN7IP1I7DPqtk
	RwSCyOqMtmRJDIRQrr/mSOQab/X6EluyuDJlXQSyBGj7q/jXXoVL9zrNr/2JBLQ90uOqKr7vfSG
	GGBgemarc9EeDJIgAI4owQV0qhbZTjLZ5CEhnFIWsiyNqopvf4UVwsTbYWls8juaaNOfolQSaZN
	HKX6wEW1yXXDQZfRylUczbRhDiyPROWjyohq+Y9mEaB36BPHntvBX1x9pM4SN83j3KhENKqVpsQ
	IOOjb7/1JnzibMZn5k7XpdGzW6w9mblYAkHXV+F8RBlW1GL3eTt9DlB/56jixs1E9Y5+XOp+CJQ
	wl325INpkxPpBHc/J92Vc9HJtCSyQtqz0IDUWMxqmet9Us6hzUn83VdqOMUogXvMJdaDqg3SBWn
	TtLmn4eTPiAD6BqvQA+OUXrVrxf89ZPDmzB1+rHREsygU=
X-Received: by 2002:a05:7022:6194:b0:124:9acd:3ef9 with SMTP id a92af1059eb24-128c2d80d37mr6463109c88.8.1773133802589;
        Tue, 10 Mar 2026 02:10:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm14043239eec.17.2026.03.10.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:10:02 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: convert mutex_lock/unlock to guard and scoped_guard in rtw_pwrctrl.c
Date: Tue, 10 Mar 2026 06:09:54 -0300
Message-ID: <20260310090954.5522-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026031039-deranged-primal-f6ab@gregkh>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Mar 10, 2026 at 10:02:01AM +0100, Greg KH wrote:
> Let's not convert existing code to use guard(), but rather use it for
> newer code submitted to the kernel.

Understood, thanks for the feedback.

Gustavo
