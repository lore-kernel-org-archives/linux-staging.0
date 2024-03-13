Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD4DF62;
	Wed, 13 Mar 2024 03:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710300985; cv=none; b=e+bjBTwci4yMK6tUUjjJqOe5SrLH2LsuJMoNmm0LfJjRYCqhgQdjnz4GG3FYMm8CTt2fEa08N72LaafN6HZI15gWQJ3dwL56srqTLqYUBXNWIA6TnaDOiNgXgfW6lbKGfONu8l/Xb+uDb195DvRJ8VDCwsdElhOjdOMdmu8K2F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710300985; c=relaxed/simple;
	bh=q75T6CjXdZiLfdbqwBfbdpNeDTcQxDLhgC+M7u0WSvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7/JvmhN/Ng2psnq5HsDPjgL3sbCoNovO1MHgNfNJygbyQc84Mh4eQLKJnsTwWw463HjNLziIpfiTrI/VDQu25+JSdkK9qMx1R/OnQpVAJFYJHeQnlVIdQM9nSkP0b2MkZKXCKh8+C0D09CRCJP8yi7w+bKt/nhU7PLYUFLdoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfrM8yeM; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfrM8yeM"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-22002fbbd6bso3171210fac.3;
        Tue, 12 Mar 2024 20:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710300982; x=1710905782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cswU/qzK+hSgY5yYtg2wRRadWrJVp3EWT5DhBoH1TBI=;
        b=VfrM8yeMgXFF8/KJWLA5ZgUHDaUHXw9UKk5nZNiR+i2O6jxYHvoV1OXSnAnGuWS5A1
         zp0WcL4OXm14ZpNScTTMi813TbSQcNRRYTL3aNKnRXNo6+Iypd7ZMuXsgZRHL7PeSVKm
         W3t+Im0OetTrdP3zlbOtSRFNDMMarYEpS6SO1NdrdHbuUafX23AAm3L3n2z+4/SPM7x8
         q93Sk8gRCvUWM8uzf8l9Ue/y51CCd68awXLnRlG2kA1/3F2sMiKJDWRLIs07XcNdr5X2
         YV/nBb66hv5St8ddsblA5pvyvFznbDwaEYo/+wsmeqL1rXXPcSGLCtcVBkcRXK/ZsVtt
         2UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710300982; x=1710905782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cswU/qzK+hSgY5yYtg2wRRadWrJVp3EWT5DhBoH1TBI=;
        b=KAn3i0EkVGROMPuZ03nr6CUYVCQiig3jt+I/XKKWVztwbay+0EGFZqjBkVAFa9Vzon
         QhwGXQ0sKxWpwQDaWPESLBpq76FzC5NmwgZCyW8yDvY0EjTdAw1A4jqyjMgUU7/qZg80
         pknLwfjqKoBC5ACMNG1DC67GwRCQLfs0s4J7cNcrMjKpc6TKcrGqpa/0CrEzPio5dYPp
         YiQfzs9p2iJ0JtwBC79oQHQ32BrxT2iS1mXM7UNQIghlk1ZJNirOS/mVab2TzzL3w7AD
         qyJ3ZAW55TPvw4O3mhN9Vdlb1/DItEnb7XqqFvsx9xvA4rQUXL1gn4ynA/1z/yZX2JmR
         bMvg==
X-Forwarded-Encrypted: i=1; AJvYcCUIUwpfVQqj5dDnv5buwKlOFB3ZOC289wumZsh3eBiWtlJ1ThW0BR7Y7JUu61rvl0nXZkiEhlHuxNp7KJ7yxsHq9hZW4Tm/0K3+xeEKzaufskG0U4sLBdo2k13NUWqR44A7QBro1yVIFg==
X-Gm-Message-State: AOJu0YzdssKmN/Dvcr2aN7IIoBgaQYJrM1yz59cec7FT95qzrRfUSGMe
	RNfI4Bm2Loo7aeOND6r/3nimq01VpHURwW/sKNz7bbtTsqNuvK64kKgdAuV7Lq1PR3WqKWNEplQ
	9Ct4W2klrF33mDWkiNAF167WJngY=
X-Google-Smtp-Source: AGHT+IEiz8JrhcT1awRkr6hThHjTbPBBmqpl9NAEk5CydQz8kt+uB7vCUg8DozjejPzWs9wcvS8Ezq756933QIMWDeU=
X-Received: by 2002:a05:6870:fb88:b0:220:87b2:c13a with SMTP id
 kv8-20020a056870fb8800b0022087b2c13amr12423713oab.26.1710300982471; Tue, 12
 Mar 2024 20:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZfCM2RyeEpxooKz+@MOLeToid> <ZfC6JeVBa9weWBSU@aschofie-mobl2>
In-Reply-To: <ZfC6JeVBa9weWBSU@aschofie-mobl2>
From: Felix Kimbu <felixkimbu1@gmail.com>
Date: Wed, 13 Mar 2024 04:36:10 +0100
Message-ID: <CAK=vLxJmefBNh9tseipYhQiYY6ZYZzoij3oCBKHy3qaH3+bGiw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: wlan-ng: Rename 'foo' to 'rc' in p80211conv.c
To: Alison Schofield <alison.schofield@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 9:25=E2=80=AFPM Alison Schofield
<alison.schofield@intel.com> wrote:

Greetings Alison,
Thanks for the review. I will work and resubmit the v4 as guided.
Regards

>
> On Tue, Mar 12, 2024 at 06:11:53PM +0100, Felix N. Kimbu wrote:
>
> Hi Felix,
> Thanks for sending this v3 as a new patch. Now, I'm going to ask
> you to create a v4 to straighten out a bit more of the patch
> format.
>
> The commit message below includes some revision history that only
> belongs below the '---',  Your commit message will be with this
> patch when it is committed, and the changelog will fall away.
> The changelog benefits reviewers today, and it also is always
> retrievable in Lore for folks curious about the patches journey.
>
> So, I'll make some edits directly below indicating what I think
> v4 should look like.
>
> Caveat 1: I didn't test the patch. I expect it applies, compiles,
> and passes checkpatch.  Double check that all on v4.
>
> Caveat 2: I don't know if GregKH is going to accept this trivial
> patch. That's OK.  By the time we get though v4 you will have
> applied a bunch of patching practices that you can take forward
> to your next patches.
>
> > Rename identifer 'foo' to 'rc' Suggested-by Alison Schofield in functio=
ns
> > skb_p80211_to_ether() and skb_ether_to_p80211().
> >
>
> Replace above with:
> Rename identifier 'foo' to 'rc' in skb_p80211_to_ether() and
> skb_ether_to_p80211() to match the common kernel coding style.
>
> (Try to get the spell checker running with checkpatch to catch things
> like the misspelled 'identifer' above.)
>
>
> Delete from here:
> > Fix indentation necessitated by above rename Suggested-by Dan Carpenter
> > and Philipp Hortmann.
> >
> > This change adds intuitive meaning to the idenfier, adhering to best
> > practices and coding style.
> >
> to here.
>
> >
> > Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
> > ---
>
> (The names in parens is optional. Folks often do it to make
> it easier for reviewers to find what they last commented, and
> also it is a bit of a nod, appreciating your reviewers)
>
> Changes in v4:
> - Remove changelog comments from commit log (AlisonS)
>
> Changes in v3:
> - Create a proper new patch revision (AlisonS)
> - Use 'rc' instead of 'decrypt_check' (AlisonS)
>
> Changes in v2:
> - Fix wrong indentation introduced in v1 (DanC)
> - Correct subject to include driver (PhilippH)
>
>
