Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C5572660
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961070; cv=none; b=oWKuBYQuCeW7EoLSQH0hom+oR7SmX6fgZPNU32aLqUIgfxVXkT1De57HV1QU/IF2eKehbLZ8XdUuJSYa5Rol2pnXcA0KLnHTDZmYm5swcpkNhAEvNP/nJ3jk4q008EgKOEKvnf49zRP2OaBjWFouQ3JjHGJ3CPJ17XVDt3RdX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961070; c=relaxed/simple;
	bh=lb5aVTc3kVp2JW4FFWVMPr/dMA6Nhe4a8BGZQ173xNo=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q2GZwH1hpCeLrnGVQJ+MDJSAmCiX+RLs5hieXV72xvCnaMNxC2asioAlzFjPOfuf8cJdcqyY4LK+SW06L/yeb5c3QDn/gmk9iYXBlvD4o6jEzYcGx17zb1Bj0ZK/QkZWsItgVIuNB8RRYpmyDLWK2qoAMDc2fSuCKrors9Mtcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qb+0ffeK; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qb+0ffeK"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-470417e5b52so212713fac.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961068; x=1789565868; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DTYKNyRmxCl3EoBhJoRDEuVPa/z1zrM8kn9PHwX7QQ=;
        b=qb+0ffeKYZWqq5W2HHMIHsVZWO2OAFlsceov61vYCyu9iAFG/EsSaQRK+L+w/4lI6n
         y1KnBM/xoqSl8GSRgEa1Br1++zRlc9ITNPIUSRR4pVBXkYs73Lltd8rdZ26CpQyjXSFX
         KXt5jTeu1Wc5MGuqrhXkQIon5zdpSYTlAFs2UJKHVZ1N/y+4jGWpvjwneZT8JMd7aVzl
         jyazdh5ilzMhiZDn5nrfh6uO4aJhh6Kpy6oSzeCKyjYtZeA3oX3uU3dNCRTPPp9sjuM4
         A4W/ctelIFN/zriwkjn7soR5CxwSIBpWOkpWzab1Q0xmJoKOFe1zV9pD8c8cob5/doA0
         /mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961068; x=1789565868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DTYKNyRmxCl3EoBhJoRDEuVPa/z1zrM8kn9PHwX7QQ=;
        b=KTqBV+TLqJThbEaH1246Rq7ieQn4AuS+TJ8T6kiojSMdBpPA4cl67grf5uJX2dY+AH
         ig5FOSMZd8VavGgB695idiCoqIHuA+unD+qYzZlbAv/vSYBLSfozF0bTupKLYchLO2Bp
         jUPhg0j6B9+D+wu1RnRMvg/CtimHpCMxbzpWfewrHcnnEKtV8f8Px1AHU06Bl9L0wbdr
         ZgMCxp6gxlJcM0GryxLXQPiG9TnQEnw6QdWyhdvIbDGazkw45QZ3Zlq2sk3VoIyKY6Ty
         2PjHlGuKO5PLSvnwLIA9Eh8wlBgnEe2lT0xv9f5c4M5RCcmo+3VonaIJFQs4q2Qdh03x
         JQhg==
X-Forwarded-Encrypted: i=1; AKwUvBynPFQNpTfyj0AOimy61joCkluBds4doWbsc/gNRpU+pXVK24gpB0aE6fVMR+YmeWkSd8vwKzY4xhvn5oTX@lists.linux.dev
X-Gm-Message-State: AFuF++nrCdJTSYKjGTkc7GJYlUvCyYQSpiSOSimaA11529YiQSBmW3gb
	0vRCsCy2YCzGK5yncnvPNmzPbSZMhFdGveS/yxvZzF1JwdvS9JVSis3+
X-Gm-Gg: AYBFou0bbKpWooJpbKZFqg1/mbMRIVpfLGbkPUn2jU4AxqUnqK6IK3Z8zCflFerrTM5
	iNz5QWfarnG8V00UCJPIAYugP8AvXBf+JFqwuZh8gw3vXnom3KZDjGzrCiy5U6L62JuZpjmDHka
	6SqDlqu4WSyvnzwiHirrabwM2FD+llF2+D/xEt/3UId/gTONEEkRnMkBYi9bv4vMALrpRSmUUAe
	pGvnFhh/3BW/tnRVnvb8AmHQq9RLan6cbyC0X3Mptch2/W2QelRRqji3b3v7UgHrlsnuSMVhEoG
	rOGWL3EH5T3KpgJ42mNy3F4Tf4U2kLyZ6uT0x/Aq92WekcNqHvIWvb5jTIi53Rt4aQgxh6Qayqz
	Rdv8sxUu8UqaP7EeTjxFdzEriDp01O6aSevK5+s+/6czT0PITMfVZ0FrhRgujB8LkRwCE4DdEJU
	SZqZfqwERe7p9qiFKHTzrG1OVGKTji6B1vqqnsvlaomkJ8KEmCKJT0u8OEuN1IxvELMQpJQXSWL
	3T5x+eqoKxe8qw=
X-Received: by 2002:a05:6870:80c9:b0:475:a153:2dc7 with SMTP id 586e51a60fabf-47c51e7166fmr456675fac.29.1788961067894;
        Wed, 09 Sep 2026 06:37:47 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47bc86aa06dsm1591299fac.18.2026.09.09.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:37:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:37:36 +0600
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
Cc: alvasarker2004@gmail.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nikolay Kulikov <nikolayof23@gmail.com>,
 Andrei Khomenkov <khomenkov@mailbox.org>, Dalvin-Ehinoma Noah Aiguobas
 <fliegbert2@gmail.com>, Khushal Chitturi <khushalchitturi@gmail.com>, Minu
 Jin <s9430939@naver.com>, Anirban Bose <boses156@gmail.com>, Khasar
 Munkh-Erdene <02khasar@gmail.com>, Jennifer Guo <guojy.bj@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unnecessary else block with
 only a break statement
Message-ID: <20260909193736.3d7a851a@isaac-aneek-MS-7C52>
In-Reply-To: <2026090924-tiger-unaudited-e9f3@gregkh>
References: <20260909083010.13064-1-alvasarker2004@gmail.com>
	<2026090924-tiger-unaudited-e9f3@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 11:33:49 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, Sep 09, 2026 at 02:29:38PM +0600, Isaac Aneek Sarker wrote:
> > Warning found by checkpatch.pl : else is not generally useful after a
> > break or return. The function would reach the break statement after
> > if-elseif block even if the else block is not used.
> > 
> > Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > index 3c82012fdc6c..a203ef8bd6f6 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > @@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
> >  			/* Duplicate entry is found!! Do not insert current entry. */
> >  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> >  			return false;
> > -		else
> > -			break;
> > +
> > +		break;
> 
> Did you test this code?  It looks like you now just changed the logic a
> lot, right?
> 
> thanks,
> 
> greg k-h

No I didn't test the code. And I don't have the required hardware. But I would like to know what are widely used test methods in linux kernel dev to test a driver when you don't have the relevant hardware vs when you have one for and finally test the code. At first it seemed a trivial change to me because that else block would only execute if the if-elseif block didnt execute, which made me come to the decision that the else block was unnecessary.
