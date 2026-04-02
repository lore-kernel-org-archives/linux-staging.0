Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60F3CE49B
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134806; cv=pass; b=ix6NuTEnQ9EENqEmcrtJe8rIufRUQUicL3wLKegkrYO79k/3CIpte3EgG0+1gLaw5B2Ya4P7laeQ3WBdQVV1+cm+2fQZ48PNYA/qYJVDyzTbFSiRwT1648NyaI6BUJCpYimNLTDn0a/Ov6KFWu9c9JZNb8AHZX8Ccn2xcN/6IDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134806; c=relaxed/simple;
	bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaRR5h83Lmlb2d4dPjTNHeCSaSgk3vmWgTWjZCVz5ROvT7BL1aFjBFtfyz5svJsIojDiCi8iM+orwRqZ81P1aJqNrxPBwtcXybpvRECLp05zoWG2NuBRJeS5+FZ+zxtJIj3TzcsCV5ootwZlcOsUw0w2hsv525w29sYUC1OiK74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu/8DaWd; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu/8DaWd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf906b007so529526f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 05:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134793; cv=none;
        d=google.com; s=arc-20240605;
        b=Dfs+UKANIwj07Ehc7hKAGm//Rgksxm96nLZYLI35Rhlo6zaKeFPwuQQwAFZaUvTAzt
         ij4s636wRR7UkZYBq3XDf9ftbxLw8DgEH6AfBjaApbttXckKMhd9AAVZHL+5KNFMIRB3
         E9Pgs9CWb9CMSjR/GuIlYHed6P0isVTEPvG4YaPF/O6F9WPi+AbWQtYlA/RcU8iod/RE
         0SfVKfC5rKkNyWwF+nbzyNhUwORfP37D7HjXBNQedHi7BHHMUA76U9E3WeY66v9EyPbj
         XvqtZ2mNa2hX0rBXqs5eXySj1/lQUrScVI5Sq0cNnIZ32qdfEKxz+Xye9t2IWdPER/Rk
         GzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        fh=AMD6hDVF/HKhxAkOdUKW5LB+Jo/5ElE7r8ucwbn9iTs=;
        b=a9Ouiz789+v1g8t2MAWfgUAkafzNfg9wODfwViTGGePRFg41bX8guUiSLl3e8fu76I
         QGmrfFWcbhVfEmi9J4Hwou9kjAbJEvVyRsMlkHjeGEBZcNdV44zDnmEo2L7R0CufvNYu
         88Kvv2+47zAoljmwLiHsgfezrSrIFufDi+9KNCAcrSoa50+aziBe1SLOVvbNGUNuEzLL
         nplBkK4w+irrtI/t1Q3pdGnkefBTwMZcP+zaH+gCbxKPhuRM3Q2v+Mf5y2/SH76SEP88
         zoatOeGRGskfkMHXHaMBHSm7FgZlwYzHR22rIQxkRgLL30lYe/nWVneWFX0Zf9gYGx/M
         InTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134793; x=1775739593; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        b=Vu/8DaWdDnChT+girzwUc/1YeiaKe2qHYfC2FijGwA3K5/9che+czFLAxZGI2hGIVM
         QddcCU1KFXmG4fSv5PKjRVxZOXDx/xRbi9GDwkjOe3uYnh0nAA7qTk5kkUgQtifpVI2T
         yuwqceHaogCFwavMVsQVTOt2YQ64mX5/LVen+nIxTvL2L7TPdv3cr/3P6JcLGeR7Kjvo
         /YVfwjHxi8lKolqoHE8Hw4C348O6bP8g3/4YUvxa1Byfyx8iH5+XAFd/Oayba5qpRVxf
         Y8MIAskWl5UMKgQLz/Ur0glAYrGiQflx0ewKFUyFXDiXyns9GMQXZJPCfqem6ug6z8pt
         EJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134793; x=1775739593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cYYKddOqyHRRi76/Oigx/tdNslYFqcTlLUf2yHBzo8=;
        b=k3V6fVgzzAC/YCmdniFahN7RJiQHSCoCckqTTp/7DcHHsNCxsH4N2Gx6n1STT5cNK6
         ajKF/RVxNh+9X2PAYZ4OFzsmxfBJAguSyVYjhESqyH7mdQMWfBVRjmjh8lyplukQ/Vnr
         iXpeie1BEqVy+9q3LrPJ4EErCH4sQITf2jYtUrBYAwtfMfNjd/z5P1qYw5zkulqUJpuH
         VNmT3XewFPkS2ip8j+W9F+XZuO2IcS2wmk7+np9WEiGrho23Ef6I2QY1KgtUMUAz8lc/
         F6li+vmF70YCPCDU729cVI742P/zelEkLHklLdNtvUdjOFk70M03uWhdVwIEj0B97jzk
         UhgA==
X-Forwarded-Encrypted: i=1; AJvYcCUAonyTAgngPFtFlI+IrJA+nnWNMzyjfEsitlN3/YsnqoIO0q57mubdd4IE6CE3MkEeJ1GYV4wDROK5Bgx9@lists.linux.dev
X-Gm-Message-State: AOJu0YwrUIansWcFNLzubWSShQyVgY/PFH8KyWQdS2zJw+Mx+wTa9qXw
	E46MGBUhxvoMQ1bnGBQi05aIVDIwQIaezQZQ+mxI9Gv3v6BLxXEwac2XsWX9aQHaJjvwda4ILSt
	STm9sRjKw2BvkiXx3XJa33/vV+Jb9gqc=
X-Gm-Gg: AeBDiesUKv4Wkz8hbpSEKekEyq6YLIibho/F83OH/C86/4WC02xGUwitUse0Mpw+21+
	9pheOLANBK3wrOvP+RDR0bxP4+er4wbiKnKfe8AjGFVjQvGOfQgLO3O3nnOGWwreyoyBQe9/DNh
	GijUCiTXP9aq6r24g6YcNTR1dLOpUIr5lc1Z067a/A/w1aUGCCoLxtLyPzyRGm8fAZTtHNdfVcZ
	AiJOMBaMwkltU7aTYBerNOnnROmDeG3euTyWg5WcNti/6V9iV7UXlN+zkCz7B8oJEQnqs3L/+Ko
	Ntivo5US4WXkqmO3IjGXibkReCQOlKJG0qJkRC9DPD6TJJqUHSBTMvVs3Lk/uihvGkFmUWYSLWa
	kv1sQE5/4W0SQWMGlhgYgVej+HA==
X-Received: by 2002:a5d:5d12:0:b0:43c:ea2d:9c7a with SMTP id
 ffacd0b85a97d-43d150f777fmr14504179f8f.49.1775134793245; Thu, 02 Apr 2026
 05:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402122333.1336-1-joshua.crofts1@gmail.com> <ac5nBB8unILvfl4P@ashevche-desk.local>
In-Reply-To: <ac5nBB8unILvfl4P@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 14:59:46 +0200
X-Gm-Features: AQROBzA3ysDGT_xhMFVUY5er_hxxQEpxHjpKOT6n7xdK8NhG49DayS3xfaZzghQ
Message-ID: <CALoEA-wS3zmoP_Cqo4N3R7_+vjXs04YMvfhEqzyfo0UAdZfPyA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 14:54, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> Wrong branch for this driver, you need to use one from git.linuxtv.org.
> Also the comments I gave against v1 are still valid.

I've replied to your comments on the v1 thread.

> Plus now the request you to read Submitting Patches and other process
> documentation, so you will know that it is required at least 24h between
> versions of the patch to give a chance others to review.

Apologies, please drop this patch, still learning the process. Thank you for
your time.

Kind regards

CJD
