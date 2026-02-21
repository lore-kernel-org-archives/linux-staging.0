Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A92222B2
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700272; cv=none; b=GvhHT8fY/oNiKlB6G36dHvrKmK+ELhqlXXrhH66roKnMytN5x+YKRSTo3Z37dq9/N1a2f+DOrsQ3pZxpYuartYLVSA6KO/AgyGcG4xZEdvGkdrDVZTELHaW+4itWIBNIWguZGFF3fp2Y1XHGs5Kh++T9+vxnEBPApl47XyuB+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700272; c=relaxed/simple;
	bh=ixXOM+1ApTVOVV1tmhp1rIxzxKrFTZJgfax+83C0Z0U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L7+e7ne7ry674zSjeGSOTisHTGZRjXvHjTkKK2jVx6ror32NpYpUhY7TDQcISodx7nC+5qMXgwuK/tqHSU+ChlIfLWVHeNsmE0X6RzgzAoxw9YdiwSTWPF9WRzTu4tzedlFx0E8SnxfTobK37mWL5eWPsoJ70V328umP0SupYKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD+Fw4EF; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD+Fw4EF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649b1ca87ddso2699183d50.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771700271; x=1772305071; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixXOM+1ApTVOVV1tmhp1rIxzxKrFTZJgfax+83C0Z0U=;
        b=aD+Fw4EFYvLkgCv+TkogRYopYX+xDs8nlpFmmwiEakZ9BkxXar/8WVTk2zqvU3cdUp
         F/Fb/zM+6n/Bqok8BHkD96NgnXYgbRqGgiyfq1KN4ctRN8+ggK54xzqJ3Kj3Y9CDjsEv
         woYHQ+XkfXWpa2pdlbBQzbPq/Z91QmF4o/4u3YYYbxrdAp+APH/GzwcBzSsoD00KaO1n
         u0bSLW5l5EsdcFGBKV+mAzzPnNMyEzEMA3IcVICupWTnxiSf6rrH3ddxQ8YALr9jOgDC
         ZAExzeOmE+ItQ1y2rZU7eMzTl1n9zmdlsiJm2NtJxCqCIGn+kB7BVcLI5mqcbFCaVPdx
         ZtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771700271; x=1772305071;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixXOM+1ApTVOVV1tmhp1rIxzxKrFTZJgfax+83C0Z0U=;
        b=rXRed6dArjrTYE9zFhGGiFbDm3x8MN9tcIER8usfd8LgNENWRaTNDviUsg+6W/cczD
         djOxGUG0H3WJid99GnIMKpU6YVZgv7GcV/caFgot3uYLWAI+dLCkK4teuyLp2mpqTovQ
         WFvNDfyXOanBMXqYOrPGaNRlmrMJjUFdZLExmDyq64dzinn1SyfGI8mAOtiXgsUTRvrX
         osbLMp9WIXyDAlwTtO31J6bdtvthlNz2LoyvNe9vZM0wew78JSEiqkX45osroq0S3HOM
         AxTeIdDLXVv0aM2b8+iItUYORAIZJh5o3ryfBL2546NSgqiRPXeN4vNQpowSyGNFGSWQ
         Duwg==
X-Forwarded-Encrypted: i=1; AJvYcCV5OV3z7qGTvtdN7CXYszyL/D5DsyEMOD44RZLpGTzHexoNbnKfC1De17BR0Q7U7a4Sx9fcfmTSEJ8EezH2@lists.linux.dev
X-Gm-Message-State: AOJu0YxQtTnqUhvymvruJDwhvE3UR0BfT+X8SOsnpUNi5PGrIkiNbySw
	QgyhStaAhlYpxAVSdpUMdUNcCtfyKv/Q0epHFWpp83Ht2e/7erqkmFsjBlM34//zUfQ=
X-Gm-Gg: AZuq6aLj9ahwsAM+wylGhQqHsg9P5f9M2/fwbH9YcordmAiTTKW+VAG/2UdO9Oirly3
	MFAa+fGtS3u4OQAGdpdIIaynqtFBUlVgrhvs2gpDNWjm+cud14S+FSFos31wBAi8UtB2kUFv+BA
	ej/zww5dbLY8wkZEh5sW9l0u+cAkmgVI4y9IGFD4Dt5z7nMzANZ3mh9kY20YkpIBQLNiNDdlb+j
	Km1GQBwFugYFzdU7M/Q7PniXu9/f8jQTuEXW2OpqRQ1GgTAeXfKoli+EO1Vbxh3dYkDK0MkEywK
	SvAOaF+nTkrXv1i+caEnrEEOxeFmnRKbSxvKgFoApj+q6YIoj4DeKptJmkKxrRFysxoKzXFKaDG
	UPZlm3Vl+rkt85VUfcehZRLzOf+pqzt/lHymBorX8Lyu4KRGR5JGx0C4J6eJqm5RNOzUMJbau3a
	KmTqUAs0eniD7XfUh7Jlg6Rzs6kpbyjWKDwrXLRzubEwpVcacaOG1GLgl8wS4Ev7fgpeiLS1Iz1
	5XBKGN0W/8GIInpDkhNUIawOZ3Vh4O5
X-Received: by 2002:a53:c589:0:b0:644:60d9:7514 with SMTP id 956f58d0204a3-64c78f5ed96mr2609679d50.88.1771700270810;
        Sat, 21 Feb 2026 10:57:50 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a37bdf7sm1261968d50.17.2026.02.21.10.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 12:57:31 -0600
Message-Id: <DGKVBNJZHINE.2C2SYIA89UQLA@gmail.com>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix spaces around binary
 operators
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218113229.9171-1-nikolayof23@gmail.com>
 <20260221172751.52329-1-nikolayof23@gmail.com>
In-Reply-To: <20260221172751.52329-1-nikolayof23@gmail.com>

On Sat Feb 21, 2026 at 11:24 AM CST, Nikolay Kulikov wrote:
> Add missing spaces and fix line length to comply with kernel coding
> style.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
