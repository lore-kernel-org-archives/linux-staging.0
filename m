Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC412E4C
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjobJTul"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbeda700015so4109772276.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 02:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704967708; x=1705572508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zps4PpI8OaSz9bFumvCqbmdTj+6HsktbWUC2QnoS1I0=;
        b=QjobJTul2buA06d5VPdE/KST50NZPpSYZtpSJoKlVKy1owjOobYFL5KpddUYY19kL8
         E1ykMpmHJNd6FSsXujChkBrVGL7zMa2KcUstgovtQxAEhRrG02eiTmJSha77cKZENVLs
         tQBIhxupOEIdvGJL+wuTnR7T0HoOEkPWjk2kneUZV9LHsHvBr0fLJRlR68hTl3NgrcMF
         YF3kr6QTs7eTGFewoFdKSqH/GBqaGk4zFYJBs6+dOzZdIG6JAMS1paw11YT+7+fCqdwj
         FhyVj52jOsqA7K0vvBO+o4Yzn1rSa/FBoDS760P4CMeO+zs3eEt7+9PbxjgrzpEht5gp
         h+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967708; x=1705572508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zps4PpI8OaSz9bFumvCqbmdTj+6HsktbWUC2QnoS1I0=;
        b=EKohTTvgI1tbMaESJwOPOFEjyURwT/KoGqfUod5aPeJ9/2F3oy+Lz+0tgIS8Xmcs91
         pFOojvhIgh1BUwbolJsEJ1T4F/AnHq3pYLtM12WsPrpuwx8/wUGAQhmaReaOR1I9y3C+
         0n8n3r4PoZMVGdgiisVnekWi6To8+LKd+155M0eVWzKctTOrMtv7/zPpM7anT3LYbix+
         CYLtJbXhVYU91E+sbbkhlJHiZEZU3n+rEuw87T99fsC6tjOJ+pnIVMFUUxpqe/Xn9ff7
         uwPEQjXzxRk4zTGT7+yL1IFYiquHjcVD9vXDwd5ND3aK0a9SUc1U6SKbjuhd0+0HcqOY
         nThw==
X-Gm-Message-State: AOJu0YzP8f9QH0QE83a8SesmUOTzNS/6628nbPY5PKV/YXlapV0fDny7
	di7ChEKmM0TIkVBLuFEyWgFG9aV1zRHP1RVV72s=
X-Google-Smtp-Source: AGHT+IEc6EgqOT3zTVEg2np101S995ycMLJ/8Szd+uMjyBhwO9sz6YXT+p1w2VTbeLW3f1iFxgsVuKsew3azO7AfTt4=
X-Received: by 2002:a05:6902:4f1:b0:dbe:a6da:204d with SMTP id
 w17-20020a05690204f100b00dbea6da204dmr882032ybs.81.1704967708072; Thu, 11 Jan
 2024 02:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240111070652.71717-1-pranavsubbu@gmail.com> <2024011144-silica-viral-9e79@gregkh>
 <CAP1Lp88vEZJtd69Njf9uZ5VXypwZ-5vLdBHf2xoLSpqmeyEQiA@mail.gmail.com>
 <CAP1Lp8-CP-uELVam=18oADOEvL_13wXkTyDLHKbjQe1ZyxiG9g@mail.gmail.com> <2024011144-sinister-baking-952d@gregkh>
In-Reply-To: <2024011144-sinister-baking-952d@gregkh>
From: Pranav Athreya <pranavsubbu@gmail.com>
Date: Thu, 11 Jan 2024 15:38:16 +0530
Message-ID: <CAP1Lp89zshQW_s0eLJjekr5tyc3XLaPnh2VGFrNDHTA7GT51ZQ@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: Remove extra blank lines between code blocks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 2:57=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Yes, please read the kernel documentation for how to submit a new
> version of a patch.

Reading the docs now and will send the patch right after. My sincere
apologies for the top posting.

Yours Sincerely,

Pranav.
