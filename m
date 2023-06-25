Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437EE7C
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 16:32:04 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-440afc96271so580464137.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687710723; x=1690302723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaMClIyzbes8/ajhVEEaqDE5A6xT3CkloKD91himAvg=;
        b=SBsMMUgM/TDiklODo1eGbYP9dnl+XJ/qf/AsD+5vx03EWGC1PK0DEMH4/nADgLyEzO
         k6K8BlJDM0Yb4u/O0t5KTr8KhBnXRvPgGih9oZLlcK/YeUcTU88T5ikh+ZOjt8McMFoQ
         nMI1sQcnBLBO98hcKRRRgZlFLVWnCQrGrqM2Wgg28lXS9/1Pz9BiyDQ/Jonn4x/nDlRE
         TKOoXX12IdG76vdkeeds/Pm8enJQeYDvnzG19v/IIGl6U2M4s0EgGtBwGPC0ugdlFkrx
         jCCLHv+t/hA+nln3A9XHFZUk/aikvluSepFoSW9nkDYREnV+TcVzzWPo8WH2Sux5Pyaq
         EL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710723; x=1690302723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaMClIyzbes8/ajhVEEaqDE5A6xT3CkloKD91himAvg=;
        b=RuYQ406gqzOHOVE2BdNLfobO404OsRZn97M48z+Iq8fojpoYhrZ2aKpU1AJNSraI6x
         Q3L3lXWA0bcSHHMU3kX+iwE0+5Kz8GEd1EAUGwFp7dKoCG9Ogp+wFATB7k/LXgVtwyMS
         77oVafQAaUooDQOi58b///gKNxBipLAmeZ5IsTDxbo5LlwvsFuRc5z0D+S1h5c+LYf64
         WSytBxfnCJlMKTAEotpllxsSTk5cBD1xP1O6+Gg+LXDB9zTReCfXYHnqiV6+9g77y2v8
         Xp5LnDYHCLYaOUnwIzP3ufPDLGxc6EuD36kg5V9I2g+nriYoB59p6rDqXhW902yeJdcR
         MhwA==
X-Gm-Message-State: AC+VfDzxO0gLEAQB+h4uglxUvCjRlWAL9oB6Laj8RUOtYd2bUBzY7GHe
	o6IZLCb9FnXcodVCc6sGj6kSkipzeGTjA6kcbeY=
X-Google-Smtp-Source: ACHHUZ53btt3b2NOfpPJbrKRlB4Vg9mJbf7rfNQwbcdLrmZ4jIh6JJCt9e9e7ivK+2NQ9usb8v4+SlMJnOcQnxRHzsQ=
X-Received: by 2002:a67:ce07:0:b0:440:d307:76f with SMTP id
 s7-20020a67ce07000000b00440d307076fmr7279107vsl.3.1687710723001; Sun, 25 Jun
 2023 09:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com> <2023062527-bride-unsolved-3b56@gregkh>
In-Reply-To: <2023062527-bride-unsolved-3b56@gregkh>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Sun, 25 Jun 2023 18:31:52 +0200
Message-ID: <CAAUT3iObhY9VOQP9FqWRR-BmFRDmOJKFdcE--pzFdNgF6ma9NA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
To: "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>
Cc: eperi1024@gmail.com, hdegoede@redhat.com, johannes.berg@intel.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, quic_vjakkam@quicinc.com, tegongkang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am So., 25. Juni 2023 um 15:55 Uhr schrieb
<gregkh@linuxfoundation.org> <gregkh@linuxfoundation.org>:
>
> On Sun, Jun 25, 2023 at 03:33:59PM +0200, Franziska N=C3=A4pelt wrote:
> > Thanks for your feedback :)
> > Since not all the patches of my first patch series have been applied, I=
 thought I have to submit the whole series again. Submitting a series of 5 =
patches, where 3 have been already applied of course fails.
> > So does it mean, if 3 of 5 patches of a series have been applied and I =
want to submit a new version, I only submit patches for the remaining work =
and not all of them again?
>
> Yes, just submit the remaining ones.
>
> thanks,
>
> greg k-h

Done in v3. Thanks :)
https://lore.kernel.org/linux-staging/CAAUT3iM3k3iVx7UOQ-s9OJ=3DaVWarAp3rED=
NTzSfY-m3yJpGe4Q@mail.gmail.com/T/#t
