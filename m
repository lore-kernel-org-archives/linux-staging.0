Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9E23C9;
	Tue, 15 Nov 2022 07:10:01 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id l15so8236139qtv.4;
        Mon, 14 Nov 2022 23:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ci//8AtumPbZmdBgdXIJtCC4M93jIqnzPE4VlT2bP2Y=;
        b=ReeDDAJQaiuNtmN+xEuzBOUCLz9Lm1i6vJKSGyihZDxbZYHA2AjsZrvs7n6CMrrwzA
         72JynWwzCMUAKagxtesd1Dll0LkVAkUfkhIkPgq+hb9UO7D9TJibXm31Bhf/5rqqWLQj
         AfvdFdQqupyk/9oAz5HgbGzvvKFpjz23H8ZBJwP1vbapJdY5nzjTHNNix4jG4MipqiV4
         NYAGuP6IQ8MDyv6RbvY9BfF0uU7YalCQaYdQQeA/+FDt2uzimxTnlNNlxCRpJHcZvOO+
         CxzMxDldU4s3ayVyhyfEHhtt3yQGGp6dXwW3PZe1+GNk0ybNqK+8xgwhNb8wRrNuKD1F
         4glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci//8AtumPbZmdBgdXIJtCC4M93jIqnzPE4VlT2bP2Y=;
        b=fg2fqFxwMRtVu24km3Jvi2CvTBKVrP9ThJ/a7lxdIX2ID+SmU2VCPsQISZAMTS5X82
         ael7zlIOHqwEpnOeKxQWskCZu/tE1W8hlTmUrzG/KuLndvQMhogfeCgsgsum236ql/vr
         ggOPbMqFLrGdbHLkbRXs60WinjcJXqk9qi2nTSHPlkbsqW3k/RxdBJ3+Op14V2xuyxk2
         GfWu4kDT/UNwQl5korDTxpbMsjgo24nCYvKyg3nNGhszYeFY1G3uDEBmxDcBLpibciDo
         P3H/phxgoNeSsmHFepK/qIGqAhH38WbsnSQRhD6SrBlwDClhbf7Crkx7hB/lrXcLfMUJ
         4Q9g==
X-Gm-Message-State: ANoB5plUXpM+ga1819a+s+ySQXKY13/D2gqUsBt1oHZbLzymHTZEAygp
	XI0twNptpDqIViWpk9cDJDTPcb3/pcwVCZSLVPY90eMn6csgcnpp
X-Google-Smtp-Source: AA0mqf4wNL6LLjWyLctKZDV3B7PDfDaoPafRosAGFFxu0e2/XkDk/IRuZt6H3DYR66xa7fWBqKjJit575nwUxcneI2E=
X-Received: by 2002:ac8:41c1:0:b0:39a:93db:bdf5 with SMTP id
 o1-20020ac841c1000000b0039a93dbbdf5mr15799524qtm.656.1668496200117; Mon, 14
 Nov 2022 23:10:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <480340b3-c1c1-74b5-1889-f49dcb644469@gmail.com> <CAHJEyKWRm_wzUcz7wzcveLLGND9F3m3HM23mpwQ=zjeO5zh5FA@mail.gmail.com>
 <ad5b7656-53fd-059f-ed77-8617a5320f2f@gmail.com>
In-Reply-To: <ad5b7656-53fd-059f-ed77-8617a5320f2f@gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Tue, 15 Nov 2022 08:09:47 +0100
Message-ID: <CAHJEyKUykNvLrDTndoA=TN4d6+4_D8F21bu_TEZowaWzSvJqEQ@mail.gmail.com>
Subject: Re: [PATCH v3] staging: vt6655: change the function name s_vFillRTSHead
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022 at 7:23 AM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 11/14/22 23:59, Tanju Brunostar wrote:
> > On Mon, Nov 14, 2022 at 9:19 PM Philipp Hortmann
> > <philipp.g.hortmann@gmail.com> wrote:
> >>
> >> On 11/14/22 19:29, Tanjuate Brunostar wrote:
> >>> Remove the use of Hungarian notation, which is not used in the Linux
> >>> kernel. Reported by checkpatch
> >>> Add indentation to the affected function to follow the Linux kernel
> >>> coding style. This improves visibility
> >>>
> >>> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> >>> ---
> >>> v2: corrected confusing changlog message on this patch
> >>> v3: removed unnecessary function prototype
> >>>
> >>>    drivers/staging/vt6655/rxtx.c | 40 ++++++++++++-----------------------
> >>>    1 file changed, 13 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> >>> index 31ae99b3cb35..715b323cd2a8 100644
> >>> --- a/drivers/staging/vt6655/rxtx.c
> >>> +++ b/drivers/staging/vt6655/rxtx.c
> >>> @@ -23,7 +23,7 @@
> >>>     *      s_uGetTxRsvTime- get frame reserved time
> >>>     *      s_vFillCTSHead- fulfill CTS ctl header
> >>>     *      s_vFillFragParameter- Set fragment ctl parameter.
> >>> - *      s_vFillRTSHead- fulfill RTS ctl header
> >>> + *      fill_rts_header- fulfill RTS ctl header
> >>>     *      s_vFillTxKey- fulfill tx encrypt key
> >>>     *      s_vSWencryption- Software encrypt header
> >>>     *      vDMA0_tx_80211- tx 802.11 frame via dma0
> >>> @@ -85,16 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
> >>>    #define DATADUR_A_F1    13
> >>>
> >>>    /*---------------------  Static Functions  --------------------------*/
> >>> -static void s_vFillRTSHead(struct vnt_private *pDevice,
> >>> -                        unsigned char byPktType,
> >>> -                        void *pvRTS,
> >>> -                        unsigned int cbFrameLength,
> >>> -                        bool bNeedAck,
> >>> -                        bool bDisCRC,
> >>> -                        struct ieee80211_hdr *hdr,
> >>> -                        unsigned short wCurrentRate,
> >>> -                        unsigned char byFBOption);
> >>> -
> >>>    static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> >>>                                   unsigned char byPktType,
> >>>                                   struct vnt_tx_fifo_head *,
> >>> @@ -555,19 +545,15 @@ s_uFillDataHead(
> >>>        return buf->duration;
> >>>    }
> >>>
> >>> -static
> >>> -void
> >>> -s_vFillRTSHead(
> >>> -     struct vnt_private *pDevice,
> >>> -     unsigned char byPktType,
> >>> -     void *pvRTS,
> >>> -     unsigned int cbFrameLength,
> >>> -     bool bNeedAck,
> >>> -     bool bDisCRC,
> >>> -     struct ieee80211_hdr *hdr,
> >>> -     unsigned short wCurrentRate,
> >>> -     unsigned char byFBOption
> >>> -)
> >>> +static void fill_rts_header(struct vnt_private *pDevice,
> >>> +                         unsigned char byPktType,
> >>> +                         void *pvRTS,
> >>> +                         unsigned int cbFrameLength,
> >>> +                         bool bNeedAck,
> >>> +                         bool bDisCRC,
> >>> +                         struct ieee80211_hdr *hdr,
> >>> +                         unsigned short wCurrentRate,
> >>> +                         unsigned char byFBOption)
> >>>    {
> >>>        unsigned int uRTSFrameLen = 20;
> >>>
> >>> @@ -912,7 +898,7 @@ s_vGenerateTxParameter(
> >>>                        buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> >>>                        buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> >>>
> >>> -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>> +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>>                } else {/* RTS_needless, PCF mode */
> >>>                        struct vnt_rrv_time_cts *buf = pvRrvTime;
> >>>
> >>> @@ -931,7 +917,7 @@ s_vGenerateTxParameter(
> >>>                        buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
> >>>
> >>>                        /* Fill RTS */
> >>> -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>> +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>>                } else if (!pvRTS) {/* RTS_needless, non PCF mode */
> >>>                        struct vnt_rrv_time_ab *buf = pvRrvTime;
> >>>
> >>> @@ -945,7 +931,7 @@ s_vGenerateTxParameter(
> >>>                        buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
> >>>
> >>>                        /* Fill RTS */
> >>> -                     s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>> +                     fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> >>>                } else { /* RTS_needless, non PCF mode */
> >>>                        struct vnt_rrv_time_ab *buf = pvRrvTime;
> >>>
> >>
> >> Hi,
> >>
> >> I cannot apply your patch.
> >>
> >> Here my git infos:
> >> git remote show origin
> >> * remote origin
> >>     Fetch URL:
> >> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> >> ...
> >> git branch -a
> >> my branch: staging-testing
> >>
> >> Bye Philipp
> >
> > I was recently asked to rebase to the staging-next branch. I think
> > this is where there is conflict
>
> I do not think so.
> between this commit:
> commit 335140116703920ddcbd9a09ae9edfb02902f3d1 (HEAD ->
> staging-testing, origin/staging-testing)
> and this one:
> commit a614e753e8e7f3322b560dcf6eaf44468ec22b3a (origin/staging-next)
>
> are only 4 commits and non of them is regarding the vt6655.
>
> So this should work.
>
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git status
> On branch staging-testing
> Your branch is up to date with 'origin/staging-testing'.
>
> nothing to commit, working tree clean
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git pull
> Already up to date.
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ cat
> ~/Downloads/20221114-\[PATCH\ v3\]\ staging_\ vt6655_\ change\ the\
> function\ name\ s_vFillRTSHead-5397.txt | git am
> Applying: staging: vt6655: change the function name s_vFillRTSHead
> error: patch failed: drivers/staging/vt6655/rxtx.c:85
> error: drivers/staging/vt6655/rxtx.c: patch does not apply
> Patch failed at 0001 staging: vt6655: change the function name
> s_vFillRTSHead
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$
>
> Bye Philipp
>

I remember you said about my previous patches that you could not apply
them. But another mentor did. So the only reason I could think of is
that my branch is based off of staging-next why yours is based on
staging-testing
