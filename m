Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B5A23;
	Thu,  3 Nov 2022 09:17:37 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id x15so728827qvp.1;
        Thu, 03 Nov 2022 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S27rf3kqtxPFXY27Pis05ywWuW6Og2HFmNiBpLHzMEw=;
        b=UCAeBUMO3aUcMiCHOkkum/+gUdMFLZHG0lTSPjNC6VodHeS1weOjt+8XYkTaveoIQP
         J0nM33wjeRHMcj0P3N4QMMBRv4uAT3EpPVkM73Y3zJVZ63oqJV0TfnmlQQtEA/hgvNaO
         SLv/3oxGdvQj7S9OYC7snzo9XnaDv0ECc6wQzRcL1OmfufmqfMSj1GC+2Inh75qRxUKO
         XBAd3DWA9KdL39StkCN3q05Ejp/zfXZt06jQfzqa8JE9dbCBdLjuRu6g4BxJstz0N6L3
         2erYzwxuTq1CBSv3E8IHTAt6XqUdySll7AsiXFdA1nWc2VCh1jJPh3cRLDlqIdhap82a
         kreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S27rf3kqtxPFXY27Pis05ywWuW6Og2HFmNiBpLHzMEw=;
        b=2Hvy7n8vzLLBNEAlff6Lr3SSVToNp7x6RSvAUjB87URPxemRfchDy03NejTKwB9/RO
         O9lhh1g10SJ078hF4EnY0VMV0DaDKslNY/q04j8mriomKqSTVevNc1K6wkunPzKSb425
         6XV7sdr2XnazADiBPB8GyphM7fu6CVO6O9PhvpM62IVSTfZfw+nfkbo4TM9IFJFxCOcb
         mvn4j/HcxbM4iuVAIWs0BKv7ALxk0nxs/Cr59GXNw7NTAku0aKctSbBkqzHcPJ99HLzb
         lJiNvfNdAd2UIipVkH6Wzqvs82bJJtboOX1PUdgJK8/Ev6odh8qpDHiShoPwWuopyaPh
         f6wQ==
X-Gm-Message-State: ACrzQf02AKM+CksEzZEg6Qk1PxLe50uyq+mhK/jzxnKkvCgxkl0aXgZI
	BE/fjYB9R8/WTdPjZD49GF6LTPmWXWiWiXoVBDk=
X-Google-Smtp-Source: AMsMyM5Oj6gFJGt+vv1xABt2GvnCRYvT3lh97M+rZ/HIwYczm9bdVU2DEbSLEDSndFW2q6XByLsn7mEzHBnG1gfBTfs=
X-Received: by 2002:a0c:e547:0:b0:4bb:66d2:2d58 with SMTP id
 n7-20020a0ce547000000b004bb66d22d58mr25788188qvm.69.1667467056490; Thu, 03
 Nov 2022 02:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1667397591.git.tanjubrunostar0@gmail.com>
 <5a0649c6019f1717cb2e2e8fc4e262f3747d73a5.1667397591.git.tanjubrunostar0@gmail.com>
 <bfc8e714fbe80a16428a447768def5764083526d.camel@perches.com>
 <CAHJEyKV75q90E1OU2YOGK70EBLm8dQe181m_nS_qmPRsPaB8TQ@mail.gmail.com> <Y2OExzH0QJqHEfNf@kadam>
In-Reply-To: <Y2OExzH0QJqHEfNf@kadam>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 3 Nov 2022 10:17:24 +0100
Message-ID: <CAHJEyKVP9ZvO-EbzGgi+Hu_XoBq18dvpnOjs886gjgvwuAdv_g@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] staging: vt6655: change the function name s_vFillRTSHead
To: Dan Carpenter <error27@gmail.com>
Cc: Joe Perches <joe@perches.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 10:07 AM Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Nov 03, 2022 at 09:48:59AM +0100, Tanju Brunostar wrote:
> > The second commit under this patchset resolves this. please take a
> > look at it and let me know if I should change anything
> >
>
> Please don't top post on email.
> http://www.catb.org/jargon/html/T/top-post.html
>
Oh my mistake. sorry
> Don't break the kernel and then fix it in a later patch.  Just fix it
> without first breaking it.
>
> regards,
> dan carpenter
>
I see. So I should send the changes in one patch right?
