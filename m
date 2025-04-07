Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E495E188A0E;
	Mon,  7 Apr 2025 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007017; cv=none; b=fVDZJ+PR/i7eJJeu+3Zb8uQ18k/xZBNPVdwgyjEGFmArgPIhhbDqiiXqTcSQVTE2lRS999Az/uHJGGXK60kF98G1Le1tkQ3+RAxGfTPV7XvBj9+CE7ic4k2WmCKq5QS0hWv0ZdqC5yyrui5z/BMcQDO98gF32r92CLFNIsTC8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007017; c=relaxed/simple;
	bh=TyYBkwgsXtht/1q0+sgnW3QamkOkK6zr816aZPw6WXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgGPGfGhJa5cxDTc7P4rzzvOI2xb3SSZBhCgQl+iYjTySQcS6yYqURUqZYHY0ULL3trNbUITtzt43UGO6KxYfMuQrpmGPKApOLGbqJdH+vc7pUroL5cixdPEZ9QjdFJm/Rw3GijmAgctNBiHVouLpQuYi2U+uA+m7EZDUTQsF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwDABWzT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwDABWzT"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6471382a12.0;
        Sun, 06 Apr 2025 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007014; x=1744611814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyYBkwgsXtht/1q0+sgnW3QamkOkK6zr816aZPw6WXk=;
        b=fwDABWzTTFQiqAVtGCxE/kiZ+rlhun9q90ZC0L+jor5oTR3svg42jbzHC09D/81E02
         VNupmLl8opQGlDc87j6JIToUPGV8CUQqY51c63NruJuVnAej3NQvoCagXfu66V7xrO53
         y2oyRlgdbMgKsQeZa5EL86ju391HLQ3QeTbWSJE1eGO/HPHkTghewm8nDBl0T1ZZO5ez
         6f49Hj7bopfCuPiKuGM/HxACffVqxbkP88kjCt27rC48G863DxkDqjLsu6ea38PkSIhN
         wMIeZRVdp35okSIsiq3R7K6ie9ZjsRWJ9PZgGKSdI/ZfhF5VOnXntyf+ZHhiNvb3aWrb
         9t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007014; x=1744611814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyYBkwgsXtht/1q0+sgnW3QamkOkK6zr816aZPw6WXk=;
        b=skMP9Tf2i+nfVxSzITecZALx2hQmRqnht58cIWcnuOPQnezWqtFBJinVA3fRc5mKqE
         9fDNhTGW/6UwHuJRJCX4ePNhDAcyv1SQV4N60jDByf4Fa2HFlprGf8GjILveKP0ny80I
         WAbDSKwj7p7lkfoqfJK78LLSFiSb/e9jOBjdX+3dsDxrChbp8vTYSNyvu6N1srJ/BRs1
         RoABxkFg8yKMhw52fUr/Nu0mpVv18DvW3pb4AU+qhgY+wH9q9/xkQlI3cr6ma8T3OzS1
         6BGhy/PQml9ox/1cOzQmk4kv4hdGge0enZM8VyVkL/q+pbo5VtHoZIn3LJiFx1AF1GIf
         L2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFr0DMUYuvXqTb5PP0lSJU0yLVumLZBUTILD+Ui1c4gM3PpTnJFGIrBNZ47fWB4X7+E1WBhs8YG6BD@lists.linux.dev, AJvYcCXeUZcEFK6VD5daVXd1CXUS12HqxC+bhw4SRTDpbXf6R1AL4nKoOkEfP6X2wBgMnA/UHyUIZ64vbtstfNu0@lists.linux.dev
X-Gm-Message-State: AOJu0YyGPu+jk1V/sjnztpijH/YQfpqmp5FUa6u5PLIY1NEXE3FWR0Za
	uGf94vET0soq5IBm9AUn/RV/WikTy7tOcs0azTFhBp7c64WjSC8+5ORewgF6CDV7s81p+21gl0n
	Xc6a/+ilyc7NStFjPEogSlyZ7np0=
X-Gm-Gg: ASbGncuCwsOBRxDk5LO3Q4E8jEU27M7F/PRSeApLNVUM6HXkGzke/MLo6QB6NjZ6xV0
	5M4nOTQtzVs3JMXqT7dP2ERfggvWZzffXkpWF7hGqTFunngNcRSre9KSBZLh3PTvdgWQqmI6q0j
	eoPXz3apKLPHZRETNHmXkG0wS0
X-Google-Smtp-Source: AGHT+IGqalXkH8jwQneb6G+HA2MFJkBI8UgaY+XXpORTBearNKmKeH+qC8U0We4DWz3sqDep+zKwZSn0M0zPtKBWZrc=
X-Received: by 2002:a05:6402:27cf:b0:5e6:4ee9:f043 with SMTP id
 4fb4d7f45d1cf-5f0db88a0a6mr5612161a12.26.1744007013996; Sun, 06 Apr 2025
 23:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
 <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
 <CAMyr_bLkvFBTpYehG4fs-tqVE18YBf53okddU2=i7+Rr-zbCsw@mail.gmail.com> <2025040711-refutable-monetary-f0c4@gregkh>
In-Reply-To: <2025040711-refutable-monetary-f0c4@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Mon, 7 Apr 2025 07:23:21 +0100
X-Gm-Features: ATxdqUG9UKRPAVgDWlaipT9LjzuBKxae31dI3bYorVW2m8bsiBkNNZsH_tYfNvI
Message-ID: <CAMyr_bJuX1vYxBhE2FvpTvjPy9jovqOmapUr-WFpO8r=5uJvAQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> Yes.
>
> Think about it from our side, what would you want to see if you had to
> review hundreds of different patches a day?

Thank you for the clarification Greg K-H, the change in perspective made
it clear, would send them in as soon as I get hold of my PC.

Richard Akintola
