Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D021946BC
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 05:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700904; cv=none; b=EOVvva5Z+uidJ2ArqtUbwrjsI7P7hHVqLC3SSKdDJPGvwnf6zARTytshETD7tGbX0vMahBCyfnukzpRxZIhXxqB6gdq8BjZiDmU19pARwq5JgaSGtxN+RxX7LmzMUOUZHbAh0U7OnZSOZylBGexuxYujblDX401+hfOEHrioBgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700904; c=relaxed/simple;
	bh=jC3VwXmv3ppGj2nHc1+PCR82gKyrqk+9M2gp9vE4r+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Jc88PlBDwNOikO4pV4E78m57UfrK+VhJRJDV3GVcnSx/a4e9gHZ1iK0dbe5pv6qdoOLWRUyOc0g41nvJoOZtrPbFz/gcl199Ptj6w3ktgtLnseUyhY5ia4vjDiDzLmO6BIj9xkiOhBYI14zQIVA3hi8bAX/lKurgxHIdMXGLTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0FO380Q; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0FO380Q"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae1729637so1763985d50.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 21:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700902; x=1771305702; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAPRC7CvVwll5YgsA5y0gH0iZdlwJ8ppRNVgM8QEa1c=;
        b=T0FO380QDMIZWPstbnkvnjJYO2knqIjEKtnIuJaCIRxTgk4Ji2B25lStMr+UtXkemB
         86eqsPbuH/1LP80qR9sHBHQHjF4PdKwCVRpA0yBIpv+DmB2uHiRTg9Keg4MJoPBbc09n
         R9HfiXfotS2gVCmLbrBqOMspEiXpZCtoNaoYOzfKAeFQRAYQUNmDSsLBUipU491Egc05
         nlNMPvgYdZ/bkECps58pvd4n6ZFEyfboGznb7o/9zANG9MqVz6tX4P/lrwHL/Imx7cUt
         mvq8uNaXxNyweU8XYocapVEKQV/PMuJFa+yJZWrzv33EEV60ys72ouy+RqnGB8bb0sF+
         dGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700902; x=1771305702;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TAPRC7CvVwll5YgsA5y0gH0iZdlwJ8ppRNVgM8QEa1c=;
        b=DcTbGJhCXxfhhiBUp8vXlMIphLkVTyo7sQEmNvt9LIuZ8iuok2WCOUluVnkx0Op5NE
         SrbwOyxhRIyNKIWQeZ8AoVO6dRvZ0N9iQcU5gfAGK/QUQEBV1vVWp0UnkkrFXvVFJUxP
         dcEZZKorR34li7+snMzn61zzxzNLXph//cpK6j8UEswt5GjWXSWCuRHNK5GspjU7UsCW
         jcq+jlTTXIRohHa/zvj/qdAe2VVsH853k2rHKihDJIUNBM10Wb9Kl+3bRC0AGUUdgAeG
         nn9jQ1W+4AB7DyPi0u8lYsGJtZpr+T+UxJ4Vltbj8pnM0iK+yEuxLv9VsNtNCVxL5YKn
         fg6A==
X-Forwarded-Encrypted: i=1; AJvYcCV8hXzisM6BBNtupAtZc8+4zKZiHhCcP9zA4odUQGH+sYK+ukTEpw3top/ovsfjTHWT77dqL0ttXzw1YUKJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzccHkuAKBJHggMnPBy7M029GGAC7/Z33neceHMgdYkT0bEejp6
	4hI1LPcY3NcBR5HMprGsqwcAJlWnmyScCW1NhDmZ9UHjwPt6rfv03uhm
X-Gm-Gg: AZuq6aIxYdy7H0U/PAGqsXtBezDFkbSVOa067XZKbxGWxRn6HdBrx0iq9noIkoL/hsm
	k3C6m2FzUiUw0A2SBlzfsnIXIKy84fYwOLD8uxhnRiADAuPTPXwBlpIhM0Gt10CDJMCPMLPvJXg
	W+mOj27U0XMY4uaCoN89+UzyZGSsL7na8IQdZ+SVw45Ov6xFafopf6hE4QJwrEPpiAyJLvGdjKN
	NtDudBjtB7TLTFXRNoZRPkNvR1kZ00PnAHrp8Ut2dwA9zd3iroF0551OxHKdh0sxSWxXJcjJMbx
	NN4LkK8rxJMBh+dvIYo5qtY4U+k1V2iHxAKeTymhgOSJVpzlqOWtwNF7YAp0MP1Lz+XEco0Akt+
	DXexsG8SoCQM+kfuws8ChkpopNDNfHA0m6Mdxtrw/IMqqHAx+jYN2GHOb9tyqydnzWwzmSXOvnM
	BED8rpEiUDuFyWoW/vZGQrPAS8oybSsem5YDqG7/DfoClQTtpUcLCtn9Kelgf9k4EMDiQF/6M1W
	hSMmkZqnOvhtyKjIWReDS7Hg4tn8Kg6
X-Received: by 2002:a53:e101:0:b0:649:ccde:d6e0 with SMTP id 956f58d0204a3-649f21b32e0mr8256657d50.92.1770700902193;
        Mon, 09 Feb 2026 21:21:42 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f254d887sm12060802d50.12.2026.02.09.21.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 23:21:26 -0600
Message-Id: <DGB12TC7CQVS.1NYPKU2YXLSF4@gmail.com>
Cc: "Siwanan Bungtong" <horstaufmental@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] staging: rtl8723bs: rtw_ap: remove unnecessary void
 * casts
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
 <20260209235133.1292161-2-horstaufmental@gmail.com>
 <DGAXL0XT4SHU.2S7DS74PUMEKD@gmail.com>
 <2026021059-overflow-quilt-e0a3@gregkh>
In-Reply-To: <2026021059-overflow-quilt-e0a3@gregkh>

On Mon Feb 9, 2026 at 11:00 PM CST, Greg KH wrote:
> On Mon, Feb 09, 2026 at 08:37:08PM -0600, Ethan Tidmore wrote:
>> On Mon Feb 9, 2026 at 5:51 PM CST, Siwanan Bungtong wrote:
>> > Remove redundant (void *) casts when calling memcpy/memset and
>> > other helpers. These casts are unnecessary since C implicitly
>> > converts to void * and they only add noise.
>> >
>> > No functional change.
>> >
>> > Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
>>=20
>> Hi,
>>=20
>> You don't have to write the file name in your subject line, "staging:
>> rtl8723bs: ..." is preferred. Please resend this patch series with the
>> correct formatting.
>
> No, for this type of series, the filename makes sense.  The subjects
> would not be unique otherwise.
>
> So the subjects are fine here.

Understood, sorry about that Siwanan.

Thanks,

ET
