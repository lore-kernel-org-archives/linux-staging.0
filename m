Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83BB7AE43;
	Thu,  7 Mar 2024 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709831703; cv=none; b=fW9U/QkLWuknc4GZowkhhZle8bXE+Ve0NtSlJLpDHqWI9i3oo8ds5lJJ7yxwfprlEhO+5NjRgNDHkNCWNUz264rXBmnt0U6V1sRdThCtDUrQXEpPQM0r2Ii79W3ONbhckayWmAWVx1SGhX0uAW2M7AT3TwnEMTHocVtI03a3bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709831703; c=relaxed/simple;
	bh=rD+uLnC2fDZSqNq0cyd3ZIQBII+Cvc05gHK4fqVP+qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IFkeasyBDPvTPAo6dCD073tyKopmWeaeeRysrr80UHovA3FOtnbtxnkXjFN286/L1rO1vH7tRKsI0EzlWJ23Ef+vIYTWU1q+txqKwLObOvgth3U525zue8fsv+TVK+aGokBBo8wHcxWRTYRloDJq8fUOWgkIrxAlnicCGlqVxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE0A2cMG; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE0A2cMG"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-788251ac2f5so9806585a.0;
        Thu, 07 Mar 2024 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709831701; x=1710436501; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1pfxEGAtho1xaN30grocEiu4Z1FQ7zMUwO8st/4gYDE=;
        b=XE0A2cMGIi0wiyPJ8s186AZKSB81ChWQQlLwaK8PFytGyWbhVYrd7MOfEqJ6xhQnEl
         cF6qRvjZykVkNeQslYCPDu29M7UnMUxMey0Gqo1vVKmsDQmaUN/K1Xetqk4CcDrUR7ph
         ALuoTGUgV9OV4MVARvLTPva6myeZ2uC5kZC6q8LHtGS839RY9gHkUWara6ofYNzVvRX4
         8vvkT+7DNyQd9GpWtJnuSAo9gQqqYt6KruOo0rC9EgnOTBM3ecDVTvGtlq+2m3j/e+pH
         WOPzqiB3rU8Jc2wJuFqBAzv+4xGnCKJBQmYN+sfV+P4YOlXIoK3kXqEA0h9QayOmJ7Y/
         oBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709831701; x=1710436501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pfxEGAtho1xaN30grocEiu4Z1FQ7zMUwO8st/4gYDE=;
        b=jymJyXUDmMj82SghfeKj5YLopDCHvLHHIQbGqnE0cDf4nMnTiRzSW3gqq48hWWBDce
         k+I1p8q861/tR/0NxfjHEzIIA4XfoOEDExuMZd8pa8NgnMkEKmFct2ALs8U8ps8AX+QN
         jXHevBnDBuVQbcDo3px1RqLU1FTFFiuGQCEKhoROryWIbqyPhkO8d7vo18EtR02hJ8Ip
         yQCBbEjbi9c6fKle157HXXT1Jw0tI+HEfbfllSq3Ti/Vh2R/tL0j6FcbSVdCPE+1QF6Q
         SpNeT6SP1hs8AsU5woyEHda9CMFh1AQYTU1qY7oYvT/ujHafWNEbvhy/2SepPABHotZo
         fZLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MJSK6APo1MXVoVapezvVk7ZGQRv4iGHGSxmvaf336jGuzSCwbcnhNpGF+Xv4Vr2hXu+HvnWbeyue039OXI/Mh6TvHAgSdky9nyw8LvceqCfp5WIPidVrc60b9wnJT4AhFQA9+FGMlA==
X-Gm-Message-State: AOJu0Yx4tuZqgZ49ZrGhnvZATaIRLnloiwaP6ujEUZERGWFVrfa9zIrw
	30+dCMXLSyJSM32KMREs3gtNMUHhCSyrIKcySRLWL7c5P8fIyMg3
X-Google-Smtp-Source: AGHT+IGAPa1qnD5ZvfST1RcQPqoTb5nP6Hy1ykjt5uDbs/WDVb44e+N6Rjscf1BDFfAevkwntVFqzQ==
X-Received: by 2002:a0c:cd90:0:b0:68f:dc8d:8ad3 with SMTP id v16-20020a0ccd90000000b0068fdc8d8ad3mr2835779qvm.0.1709831700641;
        Thu, 07 Mar 2024 09:15:00 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id q13-20020a0cf5cd000000b00690adf1d0dbsm300761qvm.74.2024.03.07.09.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 09:15:00 -0800 (PST)
Message-ID: <6b37f27b-5ccc-4b90-afb5-fa46fd0c9011@gmail.com>
Date: Thu, 7 Mar 2024 18:14:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] staging: vt6655: Match open parentheses in card.c
To: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
References: <20240305210406.29644-1-dorine.a.tipo@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240305210406.29644-1-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/24 22:04, Dorine Tipo wrote:
> Align the function parameters to silence a checkpatch warning.
> 
> This patch aligns parameters in functions calculate_ofdmr_parameter(),
> card_set_phy_parameter(), card_update_tsf() and card_get_tsf_offset(),
> for better readability.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changelog:
> V2: Modified subjects to be unique for each patch, as requested by
> <gregkh@linuxfoundation.org>
>      Fixed the warnings in the patches as suggested by
> <philipp.g.hortmann@gmail.com>
> 
> V3: Combined the vt6655 patches into one patch as suggested by
> <dan.carpenter@linaro.org>
> 
> V4: Removed the multiple signed-off-by as suggested by
>      <philipp.g.hortmann@gmail.com>
>      Omitted the cover letter as the changes have been combined into one
>      patch
>      Reworked the patch subject to be concise
> 
> V5: Fixed the commit message to "Align
>      the function parameters to silence a checkpatch warning." as
>      suggested by <dan.carpenter@linaro.org>
> 
> V6: Fix trailing white spaces in the patch to silence checkpatch warning
> 
> V7: Edited the subject line to include file name as suggested by
>      <philipp.g.hortmann@gmail.com>
> 

Hi Dorine,

what is the git repo you are using and which branch?
I cannot apply your patch. See below.

Check the git repo as shown below:

I hope we can find the reason... do you modify the patch with an other 
editor?

Bye Philipp



kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git remote 
show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
   Push  URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
   HEAD branch: master
   Remote branches:
     bus_cleanup     tracked
     greybus         tracked
     main            tracked
     master          tracked
     staging-linus   tracked
     staging-next    tracked
     staging-octeon  tracked
     staging-testing tracked
   Local branches configured for 'git pull':
     master          merges with remote master
     staging-next    merges with remote staging-next
     staging-testing merges with remote staging-testing
   Local refs configured for 'git push':
     master          pushes to master          (up to date)
     staging-next    pushes to staging-next    (local out of date)
     staging-testing pushes to staging-testing (up to date)

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git branch -a
   arnd_berg
   ath10k_shorted
   checkout
   master
   rtl8192_next
   staging-next
* staging-testing
   remotes/origin/HEAD -> origin/master
   remotes/origin/bus_cleanup
   remotes/origin/greybus
   remotes/origin/main
   remotes/origin/master
   remotes/origin/staging-linus
   remotes/origin/staging-next
   remotes/origin/staging-octeon
   remotes/origin/staging-testing



kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git status
On branch staging-testing
Your branch is up to date with 'origin/staging-testing'.

nothing to commit, working tree clean
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git pull
Already up to date.
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply 
--reject --whitespace=fix ~/Downloads/20240305-\[PATCH\ v7\]\ staging_\ 
vt6655_\ Match\ open\ parentheses\ in\ card.c-14951.txt
Checking patch drivers/staging/vt6655/card.c...
error: while searching for:
  * Return Value: none
  */
static void calculate_ofdmr_parameter(unsigned char rate,
				       u8 bb_type,
				       unsigned char *tx_rate,
				       unsigned char *rsv_time)
{
	switch (rate) {
	case RATE_6M:

error: patch failed: drivers/staging/vt6655/card.c:81
error: while searching for:
  * Return Value: none
  */
bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
		    u64 bss_timestamp)
{
	u64 local_tsf;
	u64 tsf_offset = 0;

error: patch failed: drivers/staging/vt6655/card.c:288
error: while searching for:

	if (bss_timestamp != local_tsf) {
		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
						local_tsf);
		/* adjust TSF, HW's TSF add TSF Offset reg */
		tsf_offset =  le64_to_cpu(tsf_offset);
		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);

error: patch failed: drivers/staging/vt6655/card.c:297
error: while searching for:
  * Return Value: true if succeed; otherwise false
  */
bool card_set_beacon_period(struct vnt_private *priv,
			  unsigned short beacon_interval)
{
	u64 next_tbtt;


error: patch failed: drivers/staging/vt6655/card.c:321
Applying patch drivers/staging/vt6655/card.c with 4 rejects...
Rejected hunk #1.
Rejected hunk #2.
Rejected hunk #3.
Rejected hunk #4.
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$

