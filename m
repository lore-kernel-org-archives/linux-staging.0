Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B973D1CB6
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777897854; cv=pass; b=tGPbf7gzoD0Xfh2RABvTWVQOclogXOq0V8uAGykA5IrZAqpO1TYpi706b3DSSuV1AX1l9z529+BR54cIXk0mVtTWRfHA0gb5vJZoDW4umWhPGQJ9oqtnbpNNnHoAki4Rrmx2d9r/dDwZ+67gCsl9qRWSvbxcuWtxltB1Mt6HRnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777897854; c=relaxed/simple;
	bh=QPiRMH0LSCbSzFcOuFbZcmwAH8uHpao/KcbtijXV+4k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LWU83vGIIxfbBx0crmnp42gGEXXJ/I2uYGrTQlsFrkv4qUlS/MJPMTTlDxslI3PC5WP/FjN+PrZS2iJG5iRftLEb1oWC5i99RUGnOKVzGstKA0QdEP/WC8tqbG3zzSfIhKLlUKpKqIV7u2xH5qOvhlyXBn0qtypf0RE9f8l8d/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNG47DcE; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNG47DcE"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2eadb000b8cso7446721eec.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777897851; cv=none;
        d=google.com; s=arc-20240605;
        b=gfKke0A10/0ntjFyqPSl4fNAC0V0wyPHVMWPOR56JR2zooj3GLqHluP0UUWsDooy/D
         vvtv5tM/kg2hpOc0zXH4+JZFT+1QjKyoQgL0c9OvNXZZG1NreSif/hze7js1UlbxYRyo
         YY8Ja/0CDHPk/9yvKC8oklOR9cyUHyQIbpAw20gczPJer1dG3T6+p2nD7LsvgITznvjr
         LHZ0jEW8QMN8JclbD02UqPooX/tZlSLcNkI/Na7pZ9WP/D7BuYAEtNB1i2ldNRmYCuUR
         4U13alcTYDcWETAb5H98trrxzOx9ESW8hIeypeS0Kb0QyQCIxzxAXDzLLd8mCovYKkc8
         1+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=u3bY5lfOOPZ5RSg7fXQTezdEPLaKqvTUTDObGN59FRo=;
        fh=+uyH4bQAk+yBJ7I5cbeuedeeuIsobtehMVyTkF42feA=;
        b=PPPSo2EPc1GxvbMEZv0QnX+Id4PFkWmUpV7B/TUQ7Gz7tk9/xJkxwKDeX6JiehtTaV
         xum4zhcrvnkbE5sSNurU4uofZXTQ5yIgb/fnWOp6cIHm8A2t6IBkaGO8Cwh23hbFct4r
         GE5GdQev+C/I3bdZZ+xs+MwxpOOi8S4LaFTYPllz4T0EBSb6H8eRmw+fs07jI8svW5TD
         E0gShBXtvuZOkDoW24LdhuSrbpDXPsPW1JMzRocyCbRR7Pbg/4KsboMikNhyuYP+CYgt
         NeGMLccPRDedc0mOGe9DnBE7WjRVj1HQneYE3pk3wg5Epu1o83sGpgkgerbiqcDSQL91
         UJwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777897851; x=1778502651; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u3bY5lfOOPZ5RSg7fXQTezdEPLaKqvTUTDObGN59FRo=;
        b=KNG47DcES//9mvjkU1iVu41Gl/GtLcl2Ig6B1L58WMOM9PwSqxIEy7ELCKP3arpykU
         RsLfyLiSLsCyw4MGUxjB7qssHkFVpbcFPAd7x8NO7cPMuJoHIWWKtwRhnbcqN3zrH/hy
         vaexANoxM37OeTjlTOxJdX3g34dURm5s693ekgmpoiAymwHrbupkKIXZ/0/t63IExBcS
         sB/ATz2TgyVXhxn8R8RTnjC7N2WRvdw2F7LeSpJ+KqJAjy4nileDV4CuAhj3VuXoI+Gr
         qOHFb1LFO3S8k894powWgfBrn6rv5DlDG7QgmAxG2SZ0/eha9pvNcngVkNFgCM/EPv9H
         eNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897851; x=1778502651;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3bY5lfOOPZ5RSg7fXQTezdEPLaKqvTUTDObGN59FRo=;
        b=ayzYsXXe+cGhgkwPlofqHiSGvwqD46CzAFCPFQyMR5nj7BGogRnTOhUtlHni2yJ7aV
         j37XUC4RtXJbz3qIn3RBvOjlZMYHzMnttAUDqphULE8SqUxM6DFEHSWSEmCTLsXZYsfO
         BFNkj5q57F3vYHa7xHCMFrgSjv+5aGcAXg3NrYo2TDEANyyhI6YCSt5GkIy/RE97cccP
         DcdBkeV9Qf5e9iHoBxRYX3CcTGpG646/UjnJTJ65dLVmi0TIMzEHGpsF2/OPQiczQpMa
         NELtcJ0TqiPC2u2Vf/qv2qzjiU7Iu1UhKjD5TqYckgFZIK5Jo4IHOWNPTpZZ2Hcr3oL3
         8WWw==
X-Gm-Message-State: AOJu0YytajS/xMIOrcPsPwAweArXtnX3NT8rpP3Uv4r/6ufDOSqVNLVN
	8RTI0Zupw8SUT7hSgmbpYBoHKJTlyXKj/NIODfF+zK226oA2v1Wi226xeMVoanqzEswOCwywu1g
	FbfRkEegatwl1jmmjANT1COOWULsDKjGE0KvZOwY=
X-Gm-Gg: AeBDiesAEYddYVYLHjuPtD7bOefminuypV+wn0z3iEoP0+U5ut9nikPbS+k14NUk9il
	a2GbWEWkp73sK5PXscdQk+Ni+ixl+9jzYPH5ECXERcqbrsYB2X8lm6gDFtHgVAPk7XmEiRUbl9i
	oFgpPQnjHG0V2vJ5mNDrE/9RElIlQ5FrlhFpjr0H0ju0j3ihdSlINpwNFrwH5q4BXLrk8TlqR91
	Bw1Yuk6N4kbr/imAenUfrnMvWBm/czR2TesC3NGqWXUklXAUyruJm2/Zd7LNBT10ptIXe8MQZMn
	cr6Fbv7oAae17wuHuu8S
X-Received: by 2002:a05:7300:e885:b0:2da:7e33:9261 with SMTP id
 5a478bee46e88-2efba179843mr4428638eec.27.1777897851387; Mon, 04 May 2026
 05:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Romuald Delene <delenetchior1@gmail.com>
Date: Mon, 4 May 2026 13:30:39 +0100
X-Gm-Features: AVHnY4I1ex5Rg5woHMAVviNlZlxFWIDWZ-mKF5NrL3BG4U7GGjEOnwhZsOc70cA
Message-ID: <CABKit+duj0zU6kT913Q1LVuZOpsSTxhz0rff1aBTo6A=XkxDxQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	error27@gmail.com, luka.gejak@linux.dev, hansg@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 04, 2026 at 10:27:00AM +0200, Greg KH wrote:
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.

You are right and I am sorry, this exchange should have been on
the list from the start. Thank you for the gentle correction;
I will be more careful going forward.

Resending the methodology below so everyone has the same context.

For reference, the rebased series is now on the list as
[PATCH v6 0/5] and has received Reviewed-by from Dan Carpenter
and Luka Gejak.

The exchange this answers (also sent privately on April 5,
quoted here for everyone's benefit) was:

  > > To answer your questions:
  > >
  > > I do not own any RTL8723BS hardware. The problem was discovered
  > > during a code review of `recvframe_defrag()` and has not been
  > > tested on any hardware.
  >
  > What type of "manual review"?  How did you trace the data flow
  > here exactly?
  >
  > thanks,
  > greg k-h

The methodology explanation :

----- -------------------------------------------------------------------------------
-----

I reviewed memory operations (memcpy, kmalloc, buffer pointer
manipulation) in the rtl8723bs driver, focusing on rtw_recv.c which
has 40 memcpy calls handling network-received data.

I traced the buffer pointers (rx_data, rx_tail, rx_end) through the
inline helpers in rtw_recv.h to verify bounds checking before each
copy.

The recv_frame_hdr structure (rtw_recv.h:280-297) has four pointers
that define the buffer layout:

  rx_head --> rx_data --> rx_tail --> rx_end

rx_tail marks the end of valid data, rx_end marks the end of the
allocated buffer. The space available for writing is rx_end - rx_tail.

The defrag path in recvframe_defrag() (rtw_recv.c:1074) stood out
because it is the only place where memcpy is called before
recvframe_put validates the buffer space. In each iteration of the
while loop (line 1108), three operations happen in sequence:

 1. recvframe_pull(pnextrframe, wlanhdr_offset) at line 1130 strips
    the 802.11 header from the incoming fragment by advancing its
    rx_data pointer (rtw_recv.h:369). After this, pnfhdr->len
    contains only the payload size.

 2. recvframe_pull_tail(prframe, icv_len) at line 1133 removes the
    ICV from the accumulation buffer by moving rx_tail backward
    (rtw_recv.h:420), freeing a few bytes of space.

 3. memcpy(pfhdr->rx_tail, pnfhdr->rx_data, pnfhdr->len) at line
    1136 copies the fragment payload into the accumulation buffer.
    Then recvframe_put(prframe, pnfhdr->len) at line 1138 advances
    rx_tail and checks if rx_tail > rx_end (rtw_recv.h:395-399).

The problem is the ordering of step 3: memcpy writes pnfhdr->len
bytes at rx_tail BEFORE recvframe_put checks whether rx_tail + len
exceeds rx_end. If the accumulated fragments exceed the buffer,
memcpy writes past rx_end into adjacent heap memory. The return
value of recvframe_put (NULL on overflow) is also never checked,
so execution continues normally.

The fragment payloads are attacker-controlled (received over the
air) and 802.11 fragmentation is handled at the MAC layer before
any authentication, so no association or key exchange is required.

Best regards,
 Romuald
