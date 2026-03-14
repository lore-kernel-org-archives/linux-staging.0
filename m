Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311F7258CD0;
	Sat, 14 Mar 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773488982; cv=none; b=DgqFvVEo0BBaBERV2evcP80iz27JriKRpMD2mmCrnNwbb/biuqWhGTxusmuzFuWBbQmDb03rpuaM9l/8biQP89zyszeoD25eaWDV/4Q4/ZNSFmEb8s8r39PsBf81WjEqlkSkUfyadYIUNY9wQv1tZruIlZt9SlVu43N/Jx/9Ek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773488982; c=relaxed/simple;
	bh=dVLzbxR16nXtrTvE5tdvca7vL7G6ckSuvyy2XmpXNLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l08TsjNfnOnNhwNTppF0sF+m6MOyZWDkxp06EBkWh0vPjEi4kF5U+WbBtUUKSM+0RQ6dON9wsv4oz0cYMQWSN9fN5eyMYQSDPiGcKSMrfx9S9xyT9mgGoau4u7DY88BlR8ZJS8jX/FIX5WROFEvIPOkh4Jr4DtXAoL2Zn8gRc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KfhuTFdm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KfhuTFdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1B6C116C6;
	Sat, 14 Mar 2026 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773488981;
	bh=dVLzbxR16nXtrTvE5tdvca7vL7G6ckSuvyy2XmpXNLA=;
	h=Date:From:To:Cc:Subject:From;
	b=KfhuTFdmOa55iuP+CJDHjDwBz5GeYCh9trL/bXBZqDB5IO8c/J/9Xg8rRaygymxFT
	 XKKh2C5uSvuqN05CmNpCh5hiB79tDq9iG8PyIhzw2Ui3IpotKSYZsw/lKZ34vzKGPm
	 urvnaThKpamSFGS85Z2bZWiEeSGAzOaxaMAi+fkU=
Date: Sat, 14 Mar 2026 12:49:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.0-rc4
Message-ID: <abVLUU5XP6XPck2a@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc4

for you to fetch changes up to a75281626fc8fa6dc6c9cc314ee423e8bc45203b:

  staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie (2026-02-24 10:01:20 -0800)

----------------------------------------------------------------
Staging driver fixes for 7.0-rc4

Here are 3 small staging driver fixes for 7.0-rc4 that resolve some
reported problems.  They are:
  - two rtl8723bs data validation bugfixes
  - sm750fb removal path bugfix

All of these have been in linux-next for many weeks with no reported
issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Artem Lytkin (1):
      staging: sm750fb: add missing pci_release_region on error and removal

Greg Kroah-Hartman (1):
      staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()

Luka Gejak (1):
      staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme.c      |  5 ++++-
 drivers/staging/sm750fb/sm750.c                |  1 +
 drivers/staging/sm750fb/sm750_hw.c             | 22 +++++++++++-----------
 4 files changed, 26 insertions(+), 17 deletions(-)
